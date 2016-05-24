class ChangeMarriagesPriesthoods < ActiveRecord::Migration
  change_table :marriages, :priesthoods do |t|
    t.rename :date, :sacrament_date
  end
end
