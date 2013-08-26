class RenameUserNameToUsername < ActiveRecord::Migration
  def self.up
    remove_index  :users, :name
    rename_column :users, :name, :username
    add_index     :users, :username
  end

  def self.down
    remove_index  :users, :username
    rename_column :users, :username, :name
    add_index     :users, :name
  end
end
