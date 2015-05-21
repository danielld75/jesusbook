class CreateMarriages < ActiveRecord::Migration
  def change
    create_table :marriages do |t|
      t.date :date
      t.string :local
      t.string :parish
      t.string :minister
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
