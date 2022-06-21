class MenusController < ApplicationController
  def new
    @menu = Menu.new
    @users = User.pluck(:email)
    @ingredients = Ingredient.all.order(:name)
  end

  def create
    @menu = Menu.create_menu_with_options(params[:menu])
    redirect_to root_path
  end
end
