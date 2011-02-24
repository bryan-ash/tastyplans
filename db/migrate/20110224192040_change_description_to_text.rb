class ChangeDescriptionToText < ActiveRecord::Migration
  def self.up
    change_column :recipes, :description, :text
  end

  def self.down
    change_column :recipes, :description, :string
  end
end
