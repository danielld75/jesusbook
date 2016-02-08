class CreateConfirms < ActiveRecord::Migration
  def change
    create_table :confirms do |t|
      t.date :date
      t.string :local
      t.string :parish
      t.string :minister
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
