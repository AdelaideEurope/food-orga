class AddAddedByToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :added_by, :string
  end
end
