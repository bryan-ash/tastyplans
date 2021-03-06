class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      # t.database_authenticatable :null => false, became:
      t.string   "email",                              :default => "",    :null => false
      t.string   "encrypted_password",                 :default => ""
      t.string   "password_salt",                      :default => ""

      # t.recoverable became:
      t.string   "reset_password_token"

      # t.rememberable became:
      t.string   "remember_token"
      t.datetime "remember_created_at"

      #t.trackable became:
      t.integer  "sign_in_count",                      :default => 0
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip"
      t.string   "last_sign_in_ip"

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :users
  end
end
