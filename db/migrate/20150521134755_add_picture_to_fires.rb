class AddPictureToFires < ActiveRecord::Migration
  def change
  	add_column :fires, :picture, :string
  end
end
