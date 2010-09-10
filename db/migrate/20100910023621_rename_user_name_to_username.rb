class RenameUserNameToUsername < ActiveRecord::Migration
  def self.up
    rename_column :users, :name, :username
    remove_index  :users, :name
    add_index     :users, :username
  end

  def self.down
    rename_column :users, :username, :name
    remove_index  :users, :username
    add_index     :users, :name
  end
end
