class AddUserRefToBaptisms < ActiveRecord::Migration
  def change
    add_reference :baptisms, :user, index: true
    add_foreign_key :baptisms, :users
  end
end
