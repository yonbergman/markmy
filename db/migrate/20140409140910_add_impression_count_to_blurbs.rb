class AddImpressionCountToBlurbs < ActiveRecord::Migration
  def change
    add_column :blurbs, :impressions_count, :integer, default: 0
  end
end
