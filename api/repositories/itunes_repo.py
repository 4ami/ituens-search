from httpx import AsyncClient
from typing import Any, Optional

class ITunesRepository:
    @staticmethod
    async def search(term: str) -> Optional[dict[str, Any]]:
        try:
            async with AsyncClient() as client:
                response = await client.get(f"https://itunes.apple.com/search?term={term}")
                return response.json()
        except Exception as e:
            return None