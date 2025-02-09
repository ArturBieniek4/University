import unittest
from datetime import datetime, timedelta
from server import engine, Book, Rent, Session


class TestBookOperations(unittest.TestCase):

    def setUp(self):
        """Set up a clean test database before each test."""
        self.session = Session(engine)
        self.session.query(Rent).delete()
        self.session.query(Book).delete()
        self.session.commit()

    def tearDown(self):
        """Clean up the database after each test."""
        self.session.query(Rent).delete()
        self.session.query(Book).delete()
        self.session.commit()
        self.session.close()

    def test_add_book(self):
        """Test adding a book to the database."""
        book = Book(title="Test Book", author="Test Author", year=2020)
        self.session.add(book)
        self.session.commit()
        self.assertEqual(self.session.query(Book).count(), 1)

    def test_delete_book(self):
        """Test deleting a book from the database."""
        book = Book(title="Test Book", author="Test Author", year=2020)
        self.session.add(book)
        self.session.commit()
        self.session.delete(book)
        self.session.commit()
        self.assertEqual(self.session.query(Book).count(), 0)

    def test_book_validation_year(self):
        """Test validation for book year."""
        with self.assertRaises(ValueError):
            Book(title="Invalid Year Book", author="Author", year=-1)


if __name__ == '__main__':
    unittest.main()
