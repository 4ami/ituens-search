from repositories import ContentRepository, ITunesRepository
from sqlalchemy.ext.asyncio import AsyncSession
from schemas import SearchResponseSchema, ContentIn
from models import ContentModel

class ITunesController:
    def __init__(self, db: AsyncSession):
        self.db = db
        self.content_repo = ContentRepository(db)
        self.itunes_repo = ITunesRepository()

    async def search(self, term: str) -> SearchResponseSchema:
        response = await self.itunes_repo.search(term)
        if response is None:
            return SearchResponseSchema(resultCount=0, results=[])
        contents = [ContentIn.from_dict(result) for result in response["results"]]
        modelized = [ContentModel(**content.model_dump()) for content in contents]
        bulk_contents = [content for content in modelized if not await self.content_repo.is_exist(content)]
        await self.content_repo.bulk_add(contents=bulk_contents)
        return SearchResponseSchema(resultCount=response["resultCount"], results=contents)