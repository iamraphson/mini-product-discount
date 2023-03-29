from .ProductModel import Product
from app.discount.DiscountModel import Discount
from .dto.schemas import ProductResponse
from sqlalchemy.orm import aliased
from sqlalchemy.sql import func

aliased

class ProductService:
    def get_products(
        db, 
        category: str | None, 
        price_less_than: int | None,  
        page
    ) -> list[ProductResponse]:
        limit = 10
        skip = (page - 1) * limit
        product_alias = aliased(Product)
        category_discount_alias = aliased(Discount)
        product_discount_alias = aliased(Discount)
        
        product_query = db.query(
            product_alias.sku, 
            product_alias.name, 
            product_alias.category, 
            product_alias.price, 
            category_discount_alias.value.label("categoryvalue"), 
            product_discount_alias.value.label("productvalue")
            ).join(
                category_discount_alias, 
                product_alias.category == category_discount_alias.name,isouter=True
            ).join(
                product_discount_alias, 
                product_alias.sku == product_discount_alias.sku,isouter=True
            )
        
        if category:
            product_query = product_query.filter(product_alias.category == category)
            
        if price_less_than:
            product_query = product_query.filter(product_alias.price < price_less_than)
            
        products = product_query.limit(limit).offset(skip).all()
        
        formatted_prodct_response = []
        for product in products:
            formatted_prodct_response.append(ProductResponse(
                sku=product.sku,
                name=product.name,
                category=product.category,
                product_price=product.price,
                product_discount_value=product.productvalue,
                category_discount_value=product.categoryvalue
            ).computeDiscountPriceData().dict(exclude={'product_price', 'product_discount_value', 'category_discount_value'}))
            
        return formatted_prodct_response