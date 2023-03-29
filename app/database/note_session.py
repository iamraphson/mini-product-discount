from app.config import settings
import sqlalchemy
from sqlalchemy.ext.declarative import declarative_base

metadata = sqlalchemy.MetaData()

notes = sqlalchemy.Table(
    'notes',
    metadata,
    sqlalchemy.Column('id', sqlalchemy.String, primary_key=True),
    sqlalchemy.Column('title', sqlalchemy.String, nullable=False),
    sqlalchemy.Column('content', sqlalchemy.String, nullable=False),
    sqlalchemy.Column('category', sqlalchemy.String, nullable=True),
    sqlalchemy.Column('published', sqlalchemy.BOOLEAN, default=True),
    sqlalchemy.Column('createdAt', sqlalchemy.DATETIME, nullable=False),
    sqlalchemy.Column('updatedAt', sqlalchemy.DATETIME, nullable=False),
)

engine = sqlalchemy.create_engine(
    settings.SQLITE_DATABASE_URL,
    connect_args={"check_same_thread": False}
)

metadata.create_all(engine)

SessionLocal = sqlalchemy.orm.sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()