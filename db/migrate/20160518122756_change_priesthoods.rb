class ChangePriesthoods < ActiveRecord::Migration
  change_table :priesthoods do |t|
    t.rename :date, :sacrament_date
  end
end
