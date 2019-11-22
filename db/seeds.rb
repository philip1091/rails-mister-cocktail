# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
read_url = open(url).read
ingredients = JSON.parse(read_url)

ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

puts "number ing :#{Ingredient.count}"

Cocktail.destroy_all

Cocktail.create(name:"Alabama Slammer")
Cocktail.create(name:"Jack Rose  ")
Cocktail.create(name:"Habanero Martini  ")
Cocktail.create(name:"Centennial Punch")
Cocktail.create(name:"Kentucky Kiss")
Cocktail.create(name:"Caipirini")
Cocktail.create(name:"Eye Candy")
Cocktail.create(name:"Frog in a Blender")
Cocktail.create(name:"Greyhound")



