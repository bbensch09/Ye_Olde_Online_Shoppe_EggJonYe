# User Stories
We need stuff in our store

CRUD items

Item properties:
  name
  price
  image
  description
  category or categories
  other tags?
  
Users:

Does public user need an account or just do each order anonymously?

Do we have multiple admins?

Let's assume multiple admins

Implements user system with enough flexibility to handle two usertypes, admin and public

User:
name
usertype
username
password secure
email

Public user might have permanent mailing information, payment information (securely stored)
other features like permanent shopping cart, favorities, etc.
Shopping cart is an array that is one-to-one with user, contains many items, disappears when session ends.
If anonynmous users, then shopping cart must be own table with mailing and payment information.

about us......

search function





