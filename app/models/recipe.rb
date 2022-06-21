class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_one_attached :photo

  after_create :add_user_first_name

  def total_duration
    (self.preparation_duration || 0) + (self.resting_duration || 0) + (self.cooking_duration || 0)
  end

  def self.filtered_from_params(params)
    if params[:query].present?
      sql_query = " \
        recipes.name ILIKE :query \
        OR ingredients.name ILIKE :query \
      "
      @recipes = Recipe.joins(:ingredients).where(sql_query, query: "%#{params[:query]}%").uniq
    else
      @recipes = Recipe.all
    end
  end

  def self.select_with_options(params, recipe_ids, ingredient_to_add)
    all_but_already_selected = Recipe.where.not(id: recipe_ids)
    if ingredient_to_add
      self.selection_with_specific_ingredients(all_but_already_selected, ingredient_to_add)
    else
      all_but_already_selected.sample
    end
  end

  def add_user_first_name
    self.update(added_by: current_user.first_name)
  end

  def self.selection_with_specific_ingredients(all_but_already_selected, ingredient_to_add)
    Ingredient.where(id: ingredient_to_add).flat_map(&:recipes).uniq.sample
  end
end
