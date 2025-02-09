import unittest
from server import engine, Friend, Rent, Session


class TestFriendOperations(unittest.TestCase):

    def setUp(self):
        """Set up a clean test database before each test."""
        self.session = Session(engine)
        self.session.query(Rent).delete()
        self.session.query(Friend).delete()
        self.session.commit()

    def tearDown(self):
        """Clean up the database after each test."""
        self.session.query(Rent).delete()
        self.session.query(Friend).delete()
        self.session.commit()
        self.session.close()

    def test_add_friend(self):
        """Test adding a friend to the database."""
        friend = Friend(name="Test Friend", email="test@example.com")
        self.session.add(friend)
        self.session.commit()
        self.assertEqual(self.session.query(Friend).count(), 1)

    def test_delete_friend(self):
        """Test deleting a friend from the database."""
        friend = Friend(name="Test Friend", email="test@example.com")
        self.session.add(friend)
        self.session.commit()
        self.session.delete(friend)
        self.session.commit()
        self.assertEqual(self.session.query(Friend).count(), 0)

    def test_friend_validation_email(self):
        """Test validation for friend's email."""
        with self.assertRaises(ValueError):
            Friend(name="Invalid Email Friend", email="invalidemail")


if __name__ == '__main__':
    unittest.main()
