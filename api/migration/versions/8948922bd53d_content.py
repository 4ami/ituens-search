"""content

Revision ID: 8948922bd53d
Revises: 
Create Date: 2025-05-28 19:10:20.794413

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '8948922bd53d'
down_revision: Union[str, None] = None
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    op.create_table(
        "CONTENT",
        sa.Column("_id", sa.BigInteger, primary_key=True, autoincrement=True),
        sa.Column("wrapperType", sa.String(length=25), nullable=False),
        sa.Column("kind", sa.String(length=25), nullable=False),
        sa.Column("artistId", sa.BigInteger, nullable=True),
        sa.Column("collectionId", sa.BigInteger, nullable=False, index=True, unique=True),
        sa.Column("trackId", sa.BigInteger, nullable=False, index=True, unique=True),
        sa.Column("artistName", sa.String(length=255), nullable=False),
        sa.Column("collectionName", sa.String(length=255), nullable=False),
        sa.Column("trackName", sa.String(length=255), nullable=False),
        sa.Column("collectionCensoredName", sa.String(length=255), nullable=False),
        sa.Column("trackCensoredName", sa.String(length=255), nullable=False),
        sa.Column("artistViewUrl", sa.Text, nullable=True),
        sa.Column("collectionViewUrl", sa.Text, nullable=False),
        sa.Column("trackViewUrl", sa.Text, nullable=False),
        sa.Column("artworkUrl30", sa.Text, nullable=False),
        sa.Column("artworkUrl60", sa.Text, nullable=False),
        sa.Column("artworkUrl100", sa.Text, nullable=False),
        sa.Column("collectionPrice", sa.Numeric(10, 2), nullable=False),
        sa.Column("trackPrice", sa.Numeric(10, 2), nullable=False),
        sa.Column("collectionHdPrice", sa.Numeric(10, 2), nullable=True),
        sa.Column("releaseDate", sa.DateTime, nullable=False),
        sa.Column("collectionExplicitness", sa.String(length=25), nullable=True),
        sa.Column("trackExplicitness", sa.String(length=25), nullable=True),
        sa.Column("trackCount", sa.BigInteger, nullable=False),
        sa.Column("trackTimeMillis", sa.BigInteger, nullable=False),
        sa.Column("country", sa.String(length=25), nullable=False),
        sa.Column("currency", sa.String(length=3), nullable=False),
        sa.Column("primaryGenreName", sa.String(length=255), nullable=False),
        sa.Column("contentAdvisoryRating", sa.String(length=25), nullable=True),
        sa.Column("artworkUrl600", sa.Text, nullable=True),
        sa.Column("genreIds", sa.ARRAY(sa.String(length=25)), nullable=True),
        sa.Column("genres", sa.ARRAY(sa.String(length=255)), nullable=True),
        sa.Column("extra", sa.JSON, nullable=True),
        if_not_exists=True,
    )


def downgrade() -> None:
    op.drop_table("CONTENT", if_exists=True)
