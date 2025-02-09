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
engine = create_engine("sqlite:///library.db")
Base.metadata.create_all(engine)
import json
from flask import Flask, request, jsonify

app = Flask(__name__) # tego nie było w kodzie z wykładu i przez to nie działało :(

@app.route('/book/', methods=['GET'])
def get_books():
    response = {}
    with Session(engine) as session:
        response=[]
        books = session.query(Book).all()
        for book in books:
            status = "Available"
            for rent in book.rents:
                if rent.returned==False:
                    status = f"Borrowed by Friend ID {rent.friend_id}"
            response.append({"id": book.id, "title": book.title, "author": book.author, "year": book.year, "status": status})
        session.commit()
    return jsonify(response)

@app.route('/friend/', methods=['GET'])
def get_friends():
    response = {}
    with Session(engine) as session:
        response=[]
        friends = session.query(Friend).all()
        for friend in friends:
            response.append({"id": friend.id, "name": friend.name, "email": friend.email})
        session.commit()
    return jsonify(response)

@app.route('/book/add', methods=['PUT'])
def add_book():
    response = False
    args={}
    args['title']=request.args.get("title")
    args['author']=request.args.get("author")
    args['year']=request.args.get("year")
    with Session(engine) as session:
        if args['title'] and args['author'] and args['year']:
            book = Book(title=args['title'], author=args['author'], year=int(args['year']))
            session.add(book)
            response=True
        session.commit()
    return jsonify(response)

@app.route('/book/borrow', methods=['POST'])
def borrow_book():
    response = False
    book_id=int(request.args.get("book_id"))
    friend_id=int(request.args.get("friend_id"))
    with Session(engine) as session:
        book = session.query(Book).filter(Book.id == book_id).first()
        friend = session.query(Friend).filter(Friend.id == friend_id).first()

        if book and friend:
            if not all(rent.returned for rent in book.rents):
                response="Book is already borrowed!"
            else:
                rent = Rent(book_id=book_id, friend_id=friend_id, rent_time=datetime.now(), returned=False)
                session.add(rent)
                response=True
        else:
            response="Invalid book or friend ID!"
        session.commit()
    return jsonify(response)

@app.route('/book/return', methods=['POST'])
def return_book():
    response = False
    book_id = int(request.args.get("book_id"))
    with Session(engine) as session:
        rent = session.query(Rent).filter(Rent.book_id == book_id, Rent.returned == False).first()
        if rent:
            rent.returned = True
            response = True
        else:
            response = "Book not found or not borrowed."
        session.commit()
    return jsonify(response)

@app.route('/friend/add', methods=['PUT'])
def add_friend():
    response = False
    args = {}
    args['name'] = request.args.get("name")
    args['email'] = request.args.get("email")
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
def delete_book():
    book_id = int(request.args.get("book_id"))
    response = False
    with Session(engine) as session:
        book = session.query(Book).filter(Book.id == book_id).first()
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
def delete_friend():
    friend_id = int(request.args.get("friend_id"))
    response = False
    with Session(engine) as session:
        friend = session.query(Friend).filter(Friend.id == friend_id).first()
        if friend:
            if all(rent.returned for rent in friend.borrowed_books):
                session.delete(friend)
                response = True
            else:
                response = "Friend cannot be deleted; they have borrowed books."
        else:
            response = "Friend not found."
        session.commit()
    return jsonify(response)



app.run(debug=True)