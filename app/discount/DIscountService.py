from .dto.schemas import DiscountSchema
from sqlalchemy.orm import Session
from .DiscountModel import Discount

class DiscountService:
    def create_discount(db: Session, payload: DiscountSchema) -> Discount:
        new_discount = Discount(**payload.dict())
        db.add(new_discount)
        db.commit()
        db.refresh(new_discount)
        
        return new_discount