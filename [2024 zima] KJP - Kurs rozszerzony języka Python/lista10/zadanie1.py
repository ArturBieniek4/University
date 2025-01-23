import argparse
import json
from sqlalchemy import Table, Column, Integer, ForeignKey, String, DateTime, Boolean
from sqlalchemy.orm import DeclarativeBase, relationship, mapped_column, Mapped, validates, Session
from datetime import datetime
from typing import List

class Base(DeclarativeBase):
    pass

class Rent(Base):
    __tablename__ = 'rents'

    id = mapped_column(Integer, primary_key=True)

    book_id = mapped_column(Integer, ForeignKey('books.id'))
    friend_id = mapped_column(Integer, ForeignKey('friends.id'))
    rent_time = mapped_column(DateTime)
    returned = mapped_column(Boolean, nullable=False)

    book = relationship('Book', back_populates="rents")
    friend = relationship('Friend', back_populates="borrowed_books")

    @validates("rent_time")
    def validate_rent_time(self, key, rent_time):
        if rent_time > datetime.now():
            raise ValueError("Rent time must not be from the future.")
        return rent_time

class Book(Base):
    __tablename__ = 'books'

    id = mapped_column(Integer, primary_key=True)
    title = mapped_column(String)
    author = mapped_column(String)
    year = mapped_column(Integer)

    rents: Mapped[List[Rent]] = relationship("Rent", back_populates="book")

    @validates("year")
    def validate_year(self, key, year):
        if year < 0:
            raise ValueError("Year must be a positive integer.")
        return year

class Friend(Base):
    __tablename__ = 'friends'

    id = mapped_column(Integer, primary_key=True)
    name = mapped_column(String)
    email = mapped_column(String, unique=True)

    borrowed_books: Mapped[List[Rent]] = relationship("Rent", back_populates="friend")

    @validates("email")
    def validate_email(self, key, email):
        if "@" not in email:
            raise ValueError("Email must contain a '@' character.")
        return email

from sqlalchemy import create_engine
engine = create_engine("sqlite:///wyklad.db")
Base.metadata.create_all(engine)

parser = argparse.ArgumentParser(description="Library Management System")
parser.add_argument("--addfriend", action='store_true', help="Add a new friend")
parser.add_argument("--addbook", action='store_true', help="Add a new book")
parser.add_argument("--listbooks", action='store_true', help="List books")
parser.add_argument("--listfriends", action='store_true', help="List friends")
parser.add_argument("--borrowbook", nargs=2, metavar=('BOOK_ID', 'FRIEND_ID'), help="Borrow a book")
parser.add_argument("--returnbook", metavar='BOOK_ID', help="Return a book")
parser.add_argument("--title", help="Title of the book")
parser.add_argument("--author", help="Author of the book")
parser.add_argument("--year", type=int, help="Year of the book")
parser.add_argument("--name", help="Name of the friend")
parser.add_argument("--email", help="Email of the friend")

args = parser.parse_args()
with Session(engine) as session:
    if args.addbook:
        if args.title and args.author and args.year:
            book = Book(title=args.title, author=args.author, year=args.year)
            session.add(book)
            print("Book added successfully!")
        else:
            print("Error: Title, author, and year are required to add a book.")
    
    elif args.listbooks:
        books = session.query(Book).all()
        for book in books:
            status = "Available"
            for rent in book.rents:
                if rent.returned==False:
                    status = f"Borrowed by Friend ID {rent.friend_id}"
            print(f"ID: {book.id}, Title: {book.title}, Author: {book.author}, Year: {book.year}, Status: {status}")
    
    elif args.borrowbook:
        book_id, friend_id = map(int, args.borrowbook)
        book = session.query(Book).filter(Book.id == book_id).first()
        friend = session.query(Friend).filter(Friend.id == friend_id).first()

        if book and friend:
            if not all(rent.returned for rent in book.rents):
                print("Book is already borrowed.")
            else:
                rent = Rent(book_id=book_id, friend_id=friend_id, rent_time=datetime.now(), returned=False)
                session.add(rent)
                print("Book borrowed successfully!")
        else:
            print("Invalid book or friend ID.")
    
    elif args.returnbook:
        book_id = int(args.returnbook)
        rent = session.query(Rent).filter(Rent.book_id == book_id, Rent.returned == False).first()
        if rent:
            rent.returned = True
            print("Book returned successfully!")
        else:
            print("Book not found or not borrowed.")

    elif args.addfriend:
        if args.name and args.email:
            friend = Friend(name=args.name, email=args.email)
            session.add(friend)
            print("Friend added successfully!")
        else:
            print("Error: Name and email are required to add a friend.")
    elif args.listfriends:
        friends = session.query(Friend).all()
        for friend in friends:
            print(f"ID: {friend.id}, Name: {friend.name}, Email: {friend.email}")
    session.commit()