from sqlalchemy.types import String, Integer, Float
from sqlalchemy import Column, String
from app.database.session import Base

class Product(Base):
    __tablename__ = 'products'
    id = Column(Integer, primary_key=True)
    name = Column(String, nullable=True)
    sku = Column(Integer, nullable=False)
    price = Column(Float, nullable=False)
    category = Column(String, nullable=True)
    