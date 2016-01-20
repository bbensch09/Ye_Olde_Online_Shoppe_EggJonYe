# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def add_categories
  category_names = ['things for walls', 'things for torsos', 'things to go on things', 'things to read']
  category_names.each do |name|
    new_category = Category.new
    new_category.name = name
    new_category.save!
  end
end

case Rails.env
when "development"
   add_categories
when "production"
   add_categories
end
