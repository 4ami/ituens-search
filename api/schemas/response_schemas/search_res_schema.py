from pydantic import BaseModel, Field
from ..content_schema import ContentIn

class SearchResponseSchema(BaseModel):
    code: int = Field(default=200)
    resultCount: int = Field(default=0, description="The number of results found")
    results: list[ContentIn] = Field(default_factory=list, description="The list of results")