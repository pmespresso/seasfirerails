class CreateObjectives < ActiveRecord::Migration
  def change
    create_table :objectives do |t|
    	t.string :name
    end
  end
end
