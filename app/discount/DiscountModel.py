from sqlalchemy.types import String, Integer, Float
from sqlalchemy import Column, String
from app.database.session import Base
import enum

class DiscountType(str, enum.Enum):
    Product = "product"
    Category = "category"
    

class Discount(Base):
    __tablename__ = 'discounts'
    id = Column(Integer, primary_key=True)
    name = Column(String, nullable=True)
    type = Column(String, nullable=False)
    value = Column(Float, nullable=False)
    sku = Column(Integer, nullable=False)
    