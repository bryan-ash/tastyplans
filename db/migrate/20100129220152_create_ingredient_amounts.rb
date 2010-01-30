class CreateIngredientAmounts < ActiveRecord::Migration
  def self.up
    create_table :ingredient_amounts do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.string :amount
      t.string :unit

      t.timestamps
    end
  end

  def self.down
    drop_table :ingredient_amounts
  end
end
