class RemoveAboutMeAndReligionFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :aboutMe, :text
    remove_column :users, :religion, :string
    remove_column :users, :birthday, :date
  end
end
