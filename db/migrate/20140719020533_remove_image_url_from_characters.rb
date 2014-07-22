class RemoveImageUrlFromCharacters < ActiveRecord::Migration
  def change
    remove_column :characters, :image_url
  end
end
