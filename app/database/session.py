import sqlalchemy
from app.config import settings
from sqlalchemy.ext.declarative import declarative_base

db_credential = f"mysql+mysqldb://{settings.SQL_DATABASE_URL}?unix_socket=/var/run/mysqld/mysqld.sock"
engine = sqlalchemy.create_engine(db_credential, echo=True)
SessionLocal = sqlalchemy.orm.sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()