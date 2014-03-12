class CreateBlurbs < ActiveRecord::Migration
  def change
    create_table :blurbs do |t|
      t.text :text
      t.datetime :time
      t.string :source, :default => 'site'
      t.string :token

      t.timestamps
    end
  end
end
