class AddDiverIdToFires < ActiveRecord::Migration
  def change
  	add_column :fires, :diver_id, :integer
  end
end
