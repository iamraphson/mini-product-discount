from app.database.note_session import Base
from sqlalchemy import TIMESTAMP, Column, String, Boolean
from fastapi_utils.guid_type import GUID, GUID_DEFAULT_SQLITE
from sqlalchemy.sql import func

class Note(Base):
    __tablename__ = 'notes'
    id = Column(GUID, primary_key=True, default=GUID_DEFAULT_SQLITE)
    title = Column(String, nullable=False)
    content = Column(String, nullable=False)
    category = Column(String, nullable=True)
    published = Column(Boolean, default=True, nullable=False)
    createdAt = Column(TIMESTAMP(timezone=True), nullable=False, default=func.now())
    updatedAt = Column(TIMESTAMP(timezone=True), nullable=False, default=func.now())
    