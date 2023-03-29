from pydantic import BaseModel

class Price(BaseModel):
    original: float 
    final: float
    discount_percentage: str | None = None
    currency: str = "USD"
    
class ProductResponse(BaseModel):
    sku: int
    name: str | None = None
    category: str | None = None
    price: Price | None = None
    product_price: int
    product_discount_value: int | None = None
    category_discount_value: int | None = None
        
    def computeDiscountPriceData(self):
        discount: int | None = None
        if self.product_discount_value and self.category_discount_value:
            # product and category has discount
            if self.product_discount_value > self.category_discount_value:
                discount = self.product_discount_value
            else:
                 discount = self.category_discount_value
                 
        elif self.product_discount_value:
            discount = discount = self.product_discount_value
        elif self.category_discount_value:
            discount = discount = self.category_discount_value
        
        if discount:
            self.price = Price(
                original=self.product_price,
                final= (self.product_price - (discount / 100) * self.product_price),
                discount_percentage=f"{discount}%"
            )
        else:
            self.price = Price(
                original=self.product_price,
                final=self.product_price
            )
    
        return self
    