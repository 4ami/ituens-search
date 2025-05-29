from pydantic import BaseModel, Field, field_validator
from typing import Optional, List, Dict, Any
from datetime import datetime

class ContentIn(BaseModel):
    wrapperType: str
    kind: str
    artistId: Optional[int] = Field(default=None)
    collectionId: int
    trackId: int
    artistName: str
    collectionName: str
    trackName: str
    collectionCensoredName: str
    trackCensoredName: str
    artistViewUrl: Optional[str] = Field(default=None)
    collectionViewUrl: str
    trackViewUrl: str
    artworkUrl30: str
    artworkUrl60: str
    artworkUrl100: str
    collectionPrice: float
    trackPrice: float
    collectionHdPrice: Optional[float] = Field(default=None)
    releaseDate: datetime
    collectionExplicitness: str
    trackExplicitness: str
    trackCount: int
    trackTimeMillis: int
    country: str
    currency: str
    primaryGenreName: str
    contentAdvisoryRating: Optional[str] = None
    artworkUrl600: Optional[str] = Field(default=None)  
    genreIds: Optional[List[str]] = Field(default=None)
    genres: Optional[List[str]] = Field(default=None)
    extra: Optional[Dict[str, Any]] = Field(default_factory=dict)

    model_config = {
        "extra": 'allow'
    }

    @field_validator('releaseDate', mode='before')
    def validate_release_date(cls, v: Any) -> datetime:
        if isinstance(v, str):
            v = datetime.fromisoformat(v)
        return v.replace(tzinfo=None)

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "ContentIn":
        known_fields = set(cls.model_fields.keys())
        known_data = {k: v for k, v in data.items() if k in known_fields}
        extra_data = {k: v for k, v in data.items() if k not in known_fields}
        obj = cls(**known_data)
        object.__setattr__(obj, "extra", extra_data)
        return obj