class AddUserRefToMarriages < ActiveRecord::Migration
  def change
    add_reference :marriages, :user, index: true
    add_foreign_key :marriages, :users
  end
end
