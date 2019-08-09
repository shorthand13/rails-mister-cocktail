# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'json'
require 'open-uri'
list_raw = JSON.parse(open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read)
list = list_raw["drinks"] # this is an array!
list.each do |item|
  ingredient = Ingredient.new(name: item["strIngredient1"])
  ingredient.save!
end

# require 'json'
# require 'open-uri'

# url = 'https://api.github.com/users/ssaunier'
# user_serialized = open(url).read
# user = JSON.parse(user_serialized)

# puts "#{user['name']} - #{user['bio']}"
