class ChangeConfirmSacraments < ActiveRecord::Migration
  change_table :confirm_sacraments do |t|
    t.rename :date, :sacrament_date
  end
end
