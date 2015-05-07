class CreateDivers < ActiveRecord::Migration
  def change
    create_table :divers do |t|
    	t.string :divername
    	t.string :email
    	t.timestamps
    end
  end
end
