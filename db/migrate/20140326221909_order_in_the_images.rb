class OrderInTheImages < ActiveRecord::Migration
  def change
    rename_column :blurbs, :image, :image_url
    add_column :blurbs, :custom_background, :string
  end
end
