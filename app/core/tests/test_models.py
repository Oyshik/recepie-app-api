from django.test import TestCase
from django.contrib.auth import get_user_model


class ModelTests(TestCase):

    def test_create_user_with_email_successful(self):
        """Test of creating a user with an email successful"""
        email = 'test@mail.com'
        password = 'password'
        user = get_user_model().objects.create_user(
            email = email,
            password = password
        )
        self.assertEqual(user.email, email)
        self.assertTrue(user.check_password(password))

    def test_new_user_email_normalized(self):
        """ Email for the new user is normalized"""
        email = 'test@MAIL.com'
        user = get_user_model().objects.create_user(
            email=email,
            password = 'test123'
        )
        self.assertEqual (user.email , email.lower())
