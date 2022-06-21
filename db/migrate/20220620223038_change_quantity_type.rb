class ChangeQuantityType < ActiveRecord::Migration[6.0]
  def change
    change_column :recipe_ingredients, :quantity, 'integer USING CAST(quantity AS integer)'
  end
end
