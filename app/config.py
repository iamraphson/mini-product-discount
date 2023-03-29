from pydantic import BaseSettings

class Settings(BaseSettings):
    SQLITE_DATABASE_URL: str
    SQL_DATABASE_URL: str
    
    class Config:
        env_file = './.env'
    
    
settings = Settings()