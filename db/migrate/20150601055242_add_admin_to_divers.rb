class AddAdminToDivers < ActiveRecord::Migration
  def change
  	add_column :divers, :admin, :boolean, default: false
  end
end
