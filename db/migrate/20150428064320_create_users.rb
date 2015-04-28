class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastName
      t.text :aboutMe
      t.date :birthday
      t.string :religion

      t.timestamps null: false
    end
  end
end
