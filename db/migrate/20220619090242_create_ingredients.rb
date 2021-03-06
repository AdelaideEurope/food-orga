class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :season
      t.text :found_at, array: true, default: []

      t.timestamps
    end
  end
end
