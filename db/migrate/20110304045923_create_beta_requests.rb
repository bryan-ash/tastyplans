class CreateBetaRequests < ActiveRecord::Migration
  def self.up
    create_table :beta_requests do |t|
      t.string :email
      
      t.timestamps
    end
  end

  def self.down
    drop_table :beta_requests
  end
end
