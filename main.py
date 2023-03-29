from fastapi import FastAPI, status
from fastapi.exceptions import RequestValidationError
from fastapi.encoders import jsonable_encoder
from fastapi.responses import JSONResponse
from app.notes.NoteController import router as NoteRouter
from app.discount.DiscountController import router as DiscountRouter
from app.product.ProductController import router as ProductRouter

app = FastAPI()

app.include_router(NoteRouter, tags=['Notes'], prefix='/api/notes')
app.include_router(DiscountRouter, tags=['Discounts'], prefix='/api/discounts')
app.include_router(ProductRouter, tags=['Product'], prefix='/api/products')

@app.exception_handler(RequestValidationError)
async def validation_exception_handler(request, exc):
     return JSONResponse(
        status_code=status.HTTP_400_BAD_REQUEST,
        content=jsonable_encoder({"detail": exc.errors(), "body": exc.body}),
    )


@app.get('/api/health')
def health():
    return {
        "message": "Welcome to FastAPI with SQLAlchemy"
    }
    

    