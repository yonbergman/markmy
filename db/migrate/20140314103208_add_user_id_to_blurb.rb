class AddUserIdToBlurb < ActiveRecord::Migration
  def change
    add_column :blurbs, :user_id, :integer
  end
end
