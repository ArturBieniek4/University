import argparse
import json
import requests

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
parser.add_argument("--deletebook", metavar="BOOK_ID", type=int, help="Delete a book by ID")
parser.add_argument("--deletefriend", metavar="FRIEND_ID", type=int, help="Delete a friend by ID")

args = parser.parse_args()

if args.addbook:
    res = requests.put("http://127.0.0.1:5000/book/add", params={"title":args.title, "author":args.author, "year":int(args.year)})
    if res.json()==True:
        print("Book added successfully!")
    else:
        print("Error!", res.text)
    
elif args.listbooks:
    res = requests.get("http://127.0.0.1:5000/book/")
    for book in res.json():
        print(f"ID: {book['id']}, Title: {book['title']}, Author: {book['author']}, Year: {book['year']}, Status: {book['status']}")

elif args.borrowbook:
    book_id, friend_id = map(int, args.borrowbook)
    res = requests.post("http://127.0.0.1:5000/book/borrow", params={"book_id":book_id, "friend_id":friend_id})
    if res.json()==True:
        print("Book borrowed successfully!")
    else:
        print("Error!", res.text)

elif args.returnbook:
    book_id = int(args.returnbook)
    res = requests.post("http://127.0.0.1:5000/book/return", params={"book_id": book_id})
    if res.json() == True:
        print("Book returned successfully!")
    else:
        print("Error!", res.text)

elif args.addfriend:
    if args.name and args.email:
        res = requests.put("http://127.0.0.1:5000/friend/add", params={"name": args.name, "email": args.email})
        if res.json() == True:
            print("Friend added successfully!")
        else:
            print("Error!", res.text)
    else:
        print("Error: Name and email are required to add a friend.")

elif args.listfriends:
    res = requests.get("http://127.0.0.1:5000/friend/")
    for friend in res.json():
        print(f"ID: {friend['id']}, Name: {friend['name']}, Email: {friend['email']}")

elif args.deletebook:
    res = requests.delete("http://127.0.0.1:5000/book/delete", params={"book_id": args.deletebook})
    if res.json() == True:
        print("Book deleted successfully!")
    else:
        print("Error!", res.text)

elif args.deletefriend:
    res = requests.delete("http://127.0.0.1:5000/friend/delete", params={"friend_id": args.deletefriend})
    if res.json() == True:
        print("Friend deleted successfully!")
    else:
        print("Error!", res.text)
