from pydantic import BaseModel,validator
from ..DiscountModel import DiscountType

class DiscountSchema(BaseModel):
    id: int = None
    type: DiscountType
    value: float
    name: str | None = None
    sku: int | None = None
    
    @validator('name', pre=False, always=True)
    def name_value_for_category(cls, value, values):
        if values['type'] == DiscountType.Category and not value:
            raise ValueError('name must be provided when type is category')
        
        return value
    
    
    @validator('sku', pre=False, always=True)
    def name_value_for_product(cls, value, values):
        if values['type'] == DiscountType.Product and not value:
            raise ValueError('sku must be provided when type is product')
        
        return value
    
    class Config:
        orm_mode = True
        allow_population_by_field_name = True
        arbitrary_types_allowed = True
        