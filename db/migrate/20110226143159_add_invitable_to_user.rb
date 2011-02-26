class AddInvitableToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :invitation_token, :string, :limit => 20
    add_column :users, :invitation_sent_at, :datetime
    add_index  :users, :invitation_token

    change_column :users, :encrypted_password, :string, :null => true
    change_column :users, :password_salt,      :string, :null => true
  end

  def self.down
    remove_column :users, :invitation_sent_at
    remove_index  :users, :invitation_token
    remove_column :users, :invitation_token
  end
end
