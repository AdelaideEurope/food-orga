class PagesController < ApplicationController
  def home
    @current_menu = Menu.includes(recipes: [:ingredients]).last
    @ingredients_with_quantity = {}
    @current_menu.recipes.each do |recipe|
      recipe.ingredients.each do |ingredient|
        recipe_ingredient = RecipeIngredient.where(recipe_id: recipe.id, ingredient_id: ingredient.id)[0]
        if @ingredients_with_quantity[ingredient.id]
          quantity = @ingredients_with_quantity[ingredient.id][:quantity] += recipe_ingredient.quantity
          @ingredients_with_quantity[ingredient.id] = {ingredient: ingredient, quantity: quantity, unit: recipe_ingredient.unit}
        else
          @ingredients_with_quantity[ingredient.id] = {ingredient: ingredient, quantity: recipe_ingredient.quantity, unit: recipe_ingredient.unit}
        end
      end
    end
  end
end
