class RenameImageUrlToImage < ActiveRecord::Migration
  def change
    rename_column :blurbs, :image_url, :image
  end
end
