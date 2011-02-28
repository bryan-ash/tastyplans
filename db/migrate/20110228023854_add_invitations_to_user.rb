class AddInvitationsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :invitations, :integer, :default => 0
  end

  def self.down
    remove_column :users, :invitations
  end
end
