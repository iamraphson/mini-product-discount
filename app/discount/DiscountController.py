from fastapi import APIRouter, Depends, status
from app.database.session import get_db
from sqlalchemy.orm import Session
from .dto.schemas import DiscountSchema
from .DIscountService import DiscountService

router = APIRouter()


@router.post('', status_code=status.HTTP_201_CREATED)
def create_discount(body: DiscountSchema, db: Session = Depends(get_db)):
    created_discount = DiscountService.create_discount(db, body)
    
    return {
        "status": True,
        "message": "Discount created successfully",
        "note": created_discount
    }