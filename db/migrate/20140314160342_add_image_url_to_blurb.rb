class AddImageUrlToBlurb < ActiveRecord::Migration
  def change
    add_column :blurbs, :image_url, :string
  end
end
