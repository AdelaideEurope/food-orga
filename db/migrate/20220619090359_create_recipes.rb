class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :source
      t.string :author
      t.string :note
      t.string :recipe_type
      t.boolean :is_low_glycemic_index
      t.boolean :is_vegetarian
      t.integer :preparation_duration
      t.integer :cooking_duration
      t.integer :resting_duration
      t.integer :person_count
      t.integer :rating
      t.text :preparation

      t.timestamps
    end
  end
end
