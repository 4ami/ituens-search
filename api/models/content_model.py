from .base_model import Base
from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy.types import BigInteger, String, Text, DateTime, Numeric, JSON, ARRAY

class ContentModel(Base):
    __tablename__ = "CONTENT"

    _id: Mapped[BigInteger] = mapped_column(BigInteger, primary_key=True, autoincrement=True)
    wrapperType: Mapped[String] = mapped_column(String(25), nullable=False)
    kind: Mapped[String] = mapped_column(String(25), nullable=False)
    artistId: Mapped[BigInteger] = mapped_column(BigInteger, nullable=True)
    collectionId: Mapped[BigInteger] = mapped_column(BigInteger, nullable=False)
    trackId: Mapped[BigInteger] = mapped_column(BigInteger, nullable=False)
    artistName: Mapped[String] = mapped_column(String(255), nullable=False)
    collectionName: Mapped[String] = mapped_column(String(255), nullable=False)
    trackName: Mapped[String] = mapped_column(String(255), nullable=False)
    collectionCensoredName: Mapped[String] = mapped_column(String(255), nullable=False)
    trackCensoredName: Mapped[String] = mapped_column(String(255), nullable=False)
    artistViewUrl: Mapped[Text] = mapped_column(Text, nullable=True)
    collectionViewUrl: Mapped[Text] = mapped_column(Text, nullable=False)
    trackViewUrl: Mapped[Text] = mapped_column(Text, nullable=False)
    artworkUrl30: Mapped[Text] = mapped_column(Text, nullable=False)
    artworkUrl60: Mapped[Text] = mapped_column(Text, nullable=False)
    artworkUrl100: Mapped[Text] = mapped_column(Text, nullable=False)
    collectionPrice: Mapped[Numeric] = mapped_column(Numeric(10, 2), nullable=False)
    trackPrice: Mapped[Numeric] = mapped_column(Numeric(10, 2), nullable=False)
    collectionHdPrice: Mapped[Numeric] = mapped_column(Numeric(10, 2), nullable=True)
    releaseDate: Mapped[DateTime] = mapped_column(DateTime, nullable=False)
    collectionExplicitness: Mapped[String] = mapped_column(String(25), nullable=True)
    trackExplicitness: Mapped[String] = mapped_column(String(25), nullable=True)
    trackCount: Mapped[BigInteger] = mapped_column(BigInteger, nullable=False)
    trackTimeMillis: Mapped[BigInteger] = mapped_column(BigInteger, nullable=False)
    country: Mapped[String] = mapped_column(String(25), nullable=False)
    currency: Mapped[String] = mapped_column(String(3), nullable=False)
    primaryGenreName: Mapped[String] = mapped_column(String(255), nullable=False)
    contentAdvisoryRating: Mapped[String] = mapped_column(String(25), nullable=True)
    artworkUrl600: Mapped[Text] = mapped_column(Text, nullable=True)
    genreIds: Mapped[list[str]] = mapped_column(ARRAY(String), nullable=True)
    genres: Mapped[list[str]] = mapped_column(ARRAY(String), nullable=True)
    extra: Mapped[dict] = mapped_column(JSON, nullable=True)

    def props(self) -> list[str]:
        return [
            "wrapperType",
            "kind",
            "artistId",
            "collectionId",
            "trackId",
            "artistName",
            "collectionName",
            "trackName",
            "collectionCensoredName",
            "trackCensoredName",
            "artistViewUrl",
            "collectionViewUrl",
            "trackViewUrl",
            "artworkUrl30",
            "artworkUrl60",
            "artworkUrl100",
            "collectionPrice",
            "trackPrice",
            "collectionHdPrice",
            "releaseDate",
            "collectionExplicitness",
            "trackExplicitness",
            "trackCount",
            "trackTimeMillis",
            "country",
            "currency",
            "primaryGenreName",
            "contentAdvisoryRating",
            "artworkUrl600",
            "genreIds",
            "genres",
        ]