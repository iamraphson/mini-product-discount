from fastapi import APIRouter, Depends
from app.database.session import get_db
from sqlalchemy.orm import Session
from .ProductService import ProductService

router = APIRouter()

@router.get('')
def get_products(category: str | None = None, price_less_than: int | None = None, page: int = 1, db: Session = Depends(get_db)):
    product = ProductService.get_products(db, category, price_less_than, page)
    return {
        "status": True,
        "message": 'Product retrieved successfully',
        "product": product
    }