class ChangePlaceToCountry < ActiveRecord::Migration
  def change
    rename_column :users, :place, :country
  end
end
