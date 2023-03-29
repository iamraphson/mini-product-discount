from fastapi import APIRouter, status, Depends, Response
from app.notes.dto.schemas import NoteSchema
from sqlalchemy.orm import Session
from app.database.note_session import get_db
from .NoteService import Services

router = APIRouter()

@router.post('', status_code=status.HTTP_201_CREATED)
def create_note(payload: NoteSchema, db: Session = Depends(get_db)):
    created_note = Services.create_note(db ,payload)
    return {
        "status": True,
        "message": "Note created successfully",
        "note": created_note
    }


@router.get('')
def get_notes(limit: int = 10, page: int = 1, db: Session = Depends(get_db)):
    notes = Services.get_notes(db, limit, page)
    return {
        "status": True,
        "message": "Notes retrieved successfully",
        "length": len(notes),
        "notes": notes
    }


@router.get('/{noteId}')
def get_note(noteId: str, db: Session = Depends(get_db)):
    note = Services.get_note(db, noteId)
    return {
        "status": True,
        "message": "Note retrieved successfully",
        "note": note
    }


@router.patch('/{noteId}')
def update_note(noteId: str, payload: NoteSchema, db: Session = Depends(get_db)):
    note = Services.update_note(db, noteId, payload)
    return {
        "status": True,
        "message": "Note updated successfully",
        "note": note
    }


@router.delete('/{noteId}')
def delete_note(noteId: str, db: Session = Depends(get_db)):
    Services.delete_note(db, noteId)

    return Response(status_code=status.HTTP_204_NO_CONTENT)