class CreateRecipeMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_menus do |t|
      t.references :menu, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.string :day_of_week

      t.timestamps
    end
  end
end
