class ChangeBaptisms < ActiveRecord::Migration
  change_table :baptisms do |t|
    t.rename :date_baptism, :sacrament_date
  end
end
