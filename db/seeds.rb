# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

Cocktail.destroy_all

6.times do
url = 'https://www.thecocktaildb.com/api/json/v1/1/random.php'
drinks_serialized = open(url).read
drinks_list = JSON.parse(drinks_serialized)

file = URI.open(drinks_list["drinks"].first["strDrinkThumb"])

cocktail = Cocktail.new(name: drinks_list["drinks"].first["strDrink"])
cocktail.photo.attach(io: file, filename: "#{drinks_list["drinks"].first["strDrink"]}.png", content_type: 'image/png')
cocktail.save!
end

# Ingredient Seed
# url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# drinks_serialized = open(url).read
# drinks_list = JSON.parse(drinks_serialized)

# drinks_list["drinks"].each do |element|
#   ingredient = Ingredient.create!(name: element["strIngredient1"])
# end


