# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

recipe_ingredient_ids = []
ingredient1 = Ingredient.create!(name: "poudre d'amande", season: "all")
recipe_ingredients << ingredient1.id
ingredient2 = Ingredient.create!(name: "purée de noisettes", season: "all")
recipe_ingredients << ingredient2.id
ingredient3 = Ingredient.create!(name: "compote sans sucre ajouté", season: "all")
recipe_ingredients << ingredient3.id
ingredient4 = Ingredient.create!(name: "farine de pois chiches", season: "all")
recipe_ingredients << ingredient4.id
ingredient5 = Ingredient.create!(name: "farine de quinoa", season: "all")
recipe_ingredients << ingredient5.id
ingredient6 = Ingredient.create!(name: "sucre de coco", season: "all")
recipe_ingredients << ingredient6.id
ingredient7 = Ingredient.create!(name: "pépites de chocolat noir 65%", season: "all")
recipe_ingredients << ingredient7.id
ingredient8 = Ingredient.create!(name: "graines de tournesol", season: "all")
recipe_ingredients << ingredient8.id
ingredient9 = Ingredient.create!(name: "bicarbonate alimentaire", season: "all")


recipe = Recipe.create!(name: "cookies moelleux", source: "0 sucre et IG bas", author: "Berengère Philippon", recipe_type: "dessert", is_low_glycemic_index: true, is_vegetarian: true, preparation_duration: 10, cooking_duration: 12, resting_duration: 0, person_count: 5, preparation: "Mélanger les 2 farines, la poudre d'amande, le sucre de coco et le bicarbonate.
Ajouter la compote et la purée de noisettes. Bien tasser avec une cuillère pour mélanger et obtenir une pâte qui se tient en main. Finir par les pépites de chocolat et les graines de Tournesol
Sur un tapis anti-adhesif, former des tas à l'aide de 2 cuillères car cela colle un peu. Enfourner 12 min à 185°C. Le dessus doit être doré.")


recipe_ingredient_ids.each do |recipe_ingredient_id|
  RecipeIngredient.create!(ingredient_id: recipe_ingredient_id, recipe_id: recipe.id)
end

Recipe.last.photo.attach(io: File.open("#{Rails.root}/app/assets/images/cookies-moelleux.png"), filename: "cookies-moelleux.png")
