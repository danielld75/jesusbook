class CreateFirstHolyCommunions < ActiveRecord::Migration[5.0]
  def change
    create_table :first_holy_communions do |t|
      t.date :sacrament_date
      t.string :local
      t.string :parish
      t.string :minister
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
