class AddBaptismDateUserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :baptism_date_user, :date
  end
end
