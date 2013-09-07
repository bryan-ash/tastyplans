class AddInvitableToUser < ActiveRecord::Migration
change_table :users do |t|
    add_column :users, :invitation_token, :string, :limit => 20
    add_column :users, :invitation_created_at, :datetime
    add_column :users, :invitation_sent_at, :datetime
    add_column :users, :invited_by_id, :integer
    add_column :users, :invited_by_type, :string

    add_index  :users, :invitation_token

    change_column :users, :encrypted_password, :string, :null => true
    change_column :users, :password_salt,      :string, :null => true
  end
end
