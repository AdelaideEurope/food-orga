class Menu < ApplicationRecord
  has_many :recipe_menus
  has_many :recipes, through: :recipe_menus
  has_many :ingredients, through: :recipes

  def self.create_menu_with_options(params)
    menu = Menu.create!(meal_count: params[:meal_count], person_per_meal: params[:person_per_meal])

    meal_count = params[:meal_count]
    recipe_ids = []
    ingredients_to_add = params[:ingredient_ids].reject(&:blank?)

    meal_count.to_i.times do |i|
      recipe = Recipe.select_with_options(params, recipe_ids, ingredients_to_add[i])

      RecipeMenu.create!(recipe_id: recipe.id, menu_id: menu.id)
      recipe_ids << recipe.id
    end
  end
end
