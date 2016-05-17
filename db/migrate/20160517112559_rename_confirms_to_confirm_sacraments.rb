class RenameConfirmsToConfirmSacraments < ActiveRecord::Migration
  def change
    rename_table :confirms, :confirm_sacraments
  end
end
