class FireStyles < ActiveRecord::Migration
  def change
  	create_table :fire_styles do |t|
  		t.integer :style_id, :fire_id
  	end
  end
end
