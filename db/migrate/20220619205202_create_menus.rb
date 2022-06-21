class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.datetime :date
      t.integer :meal_count
      t.integer :person_per_meal

      t.timestamps
    end
  end
end
