class RecipesController < ApplicationController
  def index
    @recipes = Recipe.filtered_from_params(params)
    @recipe_count = @recipes.length
    # if !params[:query] && !params[:sort]
    #   @recipes = Product.includes(:product_group, :photo_attachment).where(farm_id: current_user.farm_id).order(:slug)
    # elsif params[:query].present?
    #   sql_query = "name ILIKE :query"
    #   @recipes = Product.where(sql_query, query: "%#{params[:query]}%").where(farm_id: current_user.farm_id).order(:slug)
    # elsif params[:sort] != "product_group"
    #   @recipes = Product.includes(:product_group, :photo_attachment).where(farm_id: current_user.farm_id).order(params[:sort])
    # else
    #   @recipes = Product.includes(:product_group, :photo_attachment).where(farm_id: current_user.farm_id).order("product_groups.name")
    # end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def add_to_latest_menu
    @recipe = Recipe.find(params[:recipe_id])
    menu = Menu.last
    menu.recipes << @recipe
    meal_count = menu.meal_count + 1
    menu.update(meal_count: meal_count)

    redirect_to root_path
  end
end
