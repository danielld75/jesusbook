class AddUserRefToPriesthoods < ActiveRecord::Migration
  def change
    add_reference :priesthoods, :user, index: true
    add_foreign_key :priesthoods, :users
  end
end
