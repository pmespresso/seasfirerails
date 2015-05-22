class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
    	t.boolean :like
    	t.integer :diver_id, :fire_id
    	t.timestamps
    end
  end
end
