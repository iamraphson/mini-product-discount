from .dto.schemas import NoteSchema
from .NoteModel import Note
from sqlalchemy.orm import Session
import logging
from fastapi import HTTPException, status

logger = logging.getLogger(__name__)
logging.basicConfig(level=logging.DEBUG)
logging.basicConfig(level=logging.INFO)
class Services:
    def create_note(db: Session, payload: NoteSchema) -> Note:
        new_note = Note(**payload.dict())
        db.add(new_note)
        db.commit()
        db.refresh(new_note)
        
        return new_note
    
    def get_notes(db: Session, limit, page) -> list[Note]:
        skip = (page - 1) * limit

        return db.query(Note).limit(limit).offset(skip).all()
    
    def get_note(db: Session, id: str) -> Note:
        note = db.query(Note).filter(Note.id == id).first()
        if not note:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"Note with id {id} is not found"
            )

        return note       

    def update_note(db: Session, id: str, payload: NoteSchema) -> Note:
        note_query = db.query(Note).filter(Note.id == id)
        note = note_query.first()
        if not note:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"Note with id {id} is not found"
            )
            
        updated_data = payload.dict(exclude_unset=True)
        note_query.update(updated_data, synchronize_session=False)
        db.commit()
        db.refresh(note)
        
        return note
        
    def delete_note(db: Session, id: str) -> None:
        note_query = db.query(Note).filter(Note.id == id)
        note = note_query.first()
        if not note:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"Note with id {id} is not found"
            )
        
        note_query.delete(synchronize_session=False)
        db.commit()
        