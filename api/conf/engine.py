from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession, AsyncEngine
from sqlalchemy.orm import sessionmaker
from typing import AsyncGenerator
from dotenv import load_dotenv
import os

load_dotenv()

DB_ENGINE=os.getenv("DB_ENGINE").format(
    DB_USER=os.getenv("DB_USER"),
    DB_PASS=os.getenv("DB_PASS"),
    DB_HOST=os.getenv("DB_HOST"),
    DB_NAME=os.getenv("DB_NAME"),
)

_engine:AsyncEngine=create_async_engine(
    url=DB_ENGINE,
    pool_size=10,
    max_overflow=5,
    pool_timeout=30,
    pool_recycle=60,
    pool_pre_ping=True, 
    future=True,
    echo=False 
)

_asyncSession=sessionmaker(
    bind=_engine,
    class_=AsyncSession,
    expire_on_commit=False
)

async def GET_ENGINE()->AsyncGenerator[AsyncSession, None]:
    async with _asyncSession() as session:
        yield session