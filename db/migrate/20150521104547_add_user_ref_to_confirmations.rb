class AddUserRefToConfirmations < ActiveRecord::Migration
  def change
    add_reference :confirmations, :user, index: true
    add_foreign_key :confirmations, :users
  end
end
