class CreateFireObjectives < ActiveRecord::Migration
  def change
    create_table :fire_objectives do |t|
    	t.integer :objective_id, :fire_id
    end
  end
end
