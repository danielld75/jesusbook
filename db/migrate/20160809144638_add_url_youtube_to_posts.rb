class AddUrlYoutubeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :url_youtube, :string
  end
end
