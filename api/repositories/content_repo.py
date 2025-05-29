from models.content_model import ContentModel
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select

class ContentRepository:
    def __init__(self, db: AsyncSession):
        self.db = db

    async def single_add(self, content: ContentModel) -> None:
        self.db.add(content)
        await self.db.commit()

    async def bulk_add(self, contents: list[ContentModel]) -> None:
        self.db.add_all(contents)
        await self.db.commit()

    async def is_exist(self, content: ContentModel) -> bool:
        result = await self.db.execute(select(ContentModel)
                .where(
                    (ContentModel.collectionId == content.collectionId) &
                    (ContentModel.trackId == content.trackId)
                ))
        return result.scalar_one_or_none() is not None
