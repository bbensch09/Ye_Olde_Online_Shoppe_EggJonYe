# User Table

- username
- email
- first
- last
- password

# UserAddressDetailsTable
- userid
- name
- address
- city
- state
- zip
- addressType

# UserFinancialDetailsTable
- userid
- creditcard
- expiry
- reference to address for that user as billing address

# Items
- name
- price
- image (multiple images is later feature) 
- description
- category (multiple categories and other tags are future feature)

# ShoppingCart
- userid
- itemid

# Order
has_one :user
has_many :items

-userid
-itemid
-addressid
-financialid



