from fastapi import FastAPI, Query, Depends, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from conf import GET_ENGINE
from sqlalchemy.ext.asyncio import AsyncSession
from controllers import ITunesController

app: FastAPI = FastAPI(
    title="ITunes Proxy API",
    description="ITunes Proxy API",
    version="0.1.0",
    root_path="/proxy",
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
@app.get("/search")
async def search(
    session:AsyncSession=Depends(GET_ENGINE),
    term:str = Query(
        ...,
        title="Search Term", 
        description="The term to search for", 
        min_length=1,
        max_length=255,
        regex = r"^[a-zA-Z0-9\u0600-\u06FF\s]+$"
    ),
):
    try:
        res= await ITunesController(session).search(term)
        return res.model_dump(exclude_none=True)
    except Exception as e:
        raise HTTPException(status_code=500, detail={"code": 500, "message": f"{e}"})
    finally:
        if session:
            await session.close()