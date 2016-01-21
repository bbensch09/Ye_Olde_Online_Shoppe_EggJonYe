FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { Faker::Internet.user_name }
  end

  factory :category do
    name { Faker::Internet.user_name }
  end

  factory :item do
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price }
    description { Faker::Company.bs }
    image_url { Faker::Placeholdit.image }
    category_id { rand(3) +1 }
  end
end
