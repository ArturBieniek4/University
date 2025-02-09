from sqlalchemy import create_engine
from flask import Flask, request, jsonify, Response
from sqlalchemy import (
    Table,
    Column,
    Integer,
    ForeignKey,
    String,
    DateTime,
    Boolean
)
from sqlalchemy.orm import (
    DeclarativeBase,
    relationship,
    mapped_column,
    Mapped,
    validates,
    Session
)
from datetime import datetime
from typing import List, Dict, Any, Optional


class Base(DeclarativeBase):
    """Database main class"""
    pass


class Rent(Base):
    """Book rental class"""
    __tablename__ = 'rents'

    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    book_id: Mapped[int] = mapped_column(Integer, ForeignKey('books.id'))
    friend_id: Mapped[int] = mapped_column(Integer, ForeignKey('friends.id'))
    rent_time: Mapped[datetime] = mapped_column(DateTime)
    returned: Mapped[bool] = mapped_column(Boolean, nullable=False)

    book: Mapped['Book'] = relationship('Book', back_populates="rents")
    friend: Mapped['Friend'] = relationship(
        'Friend', back_populates="borrowed_books")

    @validates("rent_time")
    def validate_rent_time(self, key: str, rent_time: datetime) -> datetime:
        if rent_time > datetime.now():
            raise ValueError("Rent time must not be from the future.")
        return rent_time


class Book(Base):
    """Book class"""
    __tablename__ = 'books'

    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    title: Mapped[str] = mapped_column(String)
    author: Mapped[str] = mapped_column(String)
    year: Mapped[int] = mapped_column(Integer)

    rents: Mapped[List[Rent]] = relationship("Rent", back_populates="book")

    @validates("year")
    def validate_year(self, key: str, year: int) -> int:
        if year < 0:
            raise ValueError("Year must be a positive integer.")
        return year


class Friend(Base):
    """Friend class"""
    __tablename__ = 'friends'

    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    name: Mapped[str] = mapped_column(String)
    email: Mapped[str] = mapped_column(String, unique=True)

    borrowed_books: Mapped[List[Rent]] = relationship(
        "Rent", back_populates="friend"
    )

    @validates("email")
    def validate_email(self, key: str, email: str) -> str:
        if "@" not in email:
            raise ValueError("Email must contain a '@' character.")
        return email


engine = create_engine("sqlite:///library.db")
Base.metadata.create_all(engine)

app = Flask(__name__)


@app.route('/book/', methods=['GET'])
def get_books() -> Response:
    """Get all the books"""
    response: List[Dict[str, Any]] = []
    with Session(engine) as session:
        books: List[Book] = session.query(Book).all()
        for book in books:
            status: str = "Available"
            for rent in book.rents:
                if not rent.returned:
                    status = f"Borrowed by Friend ID {rent.friend_id}"
            response.append({"id": book.id,
                             "title": book.title,
                             "author": book.author,
                             "year": book.year,
                             "status": status})
        session.commit()
    return jsonify(response)


@app.route('/friend/', methods=['GET'])
def get_friends() -> Response:
    """Get all the friends"""
    response: List[Dict[str, Any]] = []
    with Session(engine) as session:
        friends: List[Friend] = session.query(Friend).all()
        for friend in friends:
            response.append(
                {"id": friend.id, "name": friend.name, "email": friend.email})
        session.commit()
    return jsonify(response)


@app.route('/book/add', methods=['PUT'])
def add_book() -> Response:
    """Add a book"""
    response: bool = False
    args: Dict[str, Optional[str]] = {
        'title': request.args.get("title"),
        'author': request.args.get("author"),
        'year': request.args.get("year")
    }
    with Session(engine) as session:
        if args['title'] and args['author'] and args['year']:
            book = Book(
                title=args['title'],
                author=args['author'],
                year=int(
                    args['year']))
            session.add(book)
            response = True
        session.commit()
    return jsonify(response)


@app.route('/book/borrow', methods=['POST'])
def borrow_book() -> Response:
    """Borrow a book"""
    response: Any = False
    book_id_str: Optional[str] = request.args.get("book_id")
    friend_id_str: Optional[str] = request.args.get("friend_id")
    if not book_id_str or not friend_id_str:
        return jsonify("Invalid parameters.")
    try:
        book_id: int = int(book_id_str)
        friend_id: int = int(friend_id_str)
    except ValueError:
        return jsonify("Parameters must be integers.")
    with Session(engine) as session:
        book: Optional[Book] = session.query(
            Book).filter(Book.id == book_id).first()
        friend: Optional[Friend] = session.query(
            Friend).filter(Friend.id == friend_id).first()

        if book and friend:
            if not all(rent.returned for rent in book.rents):
                response = "Book is already borrowed!"
            else:
                rent = Rent(book_id=book_id, friend_id=friend_id,
                            rent_time=datetime.now(), returned=False)
                session.add(rent)
                response = True
        else:
            response = "Invalid book or friend ID!"
        session.commit()
    return jsonify(response)


@app.route('/book/return', methods=['POST'])
def return_book() -> Response:
    """Return a book"""
    response: Any = False
    book_id_str: Optional[str] = request.args.get("book_id")
    if not book_id_str:
        return jsonify("Invalid parameters.")
    try:
        book_id: int = int(book_id_str)
    except ValueError:
        return jsonify("Parameters must be integers.")
    with Session(engine) as session:
        rent: Optional[Rent] = session.query(Rent).filter(
            Rent.book_id == book_id, Rent.returned.is_(False)).first()
        if rent:
            rent.returned = True
            response = True
        else:
            response = "Book not found or not borrowed."
        session.commit()
    return jsonify(response)


@app.route('/friend/add', methods=['PUT'])
def add_friend() -> Response:
    """Add a friend"""
    response: Any = False
    args: Dict[str, Optional[str]] = {
        'name': request.args.get("name"),
        'email': request.args.get("email")
    }
    with Session(engine) as session:
        if args['name'] and args['email']:
            try:
                friend = Friend(name=args['name'], email=args['email'])
                session.add(friend)
                response = True
            except ValueError as e:
                response = str(e)
        else:
            response = "Name and email are required."
        session.commit()
    return jsonify(response)


@app.route('/book/delete', methods=['DELETE'])
def delete_book() -> Response:
    """Delete a book"""
    book_id_str: Optional[str] = request.args.get("book_id")
    if not book_id_str:
        return jsonify("Invalid parameters.")
    try:
        book_id: int = int(book_id_str)
    except ValueError:
        return jsonify("Parameters must be integers.")
    response: Any = False
    with Session(engine) as session:
        book: Optional[Book] = session.query(
            Book).filter(Book.id == book_id).first()
        if book:
            if all(rent.returned for rent in book.rents):
                session.delete(book)
                response = True
            else:
                response = "Book cannot be deleted; it is currently borrowed."
        else:
            response = "Book not found."
        session.commit()
    return jsonify(response)


@app.route('/friend/delete', methods=['DELETE'])
def delete_friend() -> Response:
    """Delete a friend"""
    friend_id_str: Optional[str] = request.args.get("friend_id")
    if not friend_id_str:
        return jsonify("Invalid parameters.")
    try:
        friend_id: int = int(friend_id_str)
    except ValueError:
        return jsonify("Parameters must be integers.")
    response: Any = False
    with Session(engine) as session:
        friend: Optional[Friend] = session.query(
            Friend).filter(Friend.id == friend_id).first()
        if friend:
            if all(rent.returned for rent in friend.borrowed_books):
                session.delete(friend)
                response = True
            else:
                response = (
                    "Friend cannot be deleted;"
                    " they have borrowed books."
                )
        else:
            response = "Friend not found."
        session.commit()
    return jsonify(response)


if __name__ == "__main__":
    app.run(debug=True)
