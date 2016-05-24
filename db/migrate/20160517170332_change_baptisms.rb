class ChangeBaptisms < ActiveRecord::Migration
  change_table :baptisms do |t|
    t.rename :date, :sacrament_date
  end
end
