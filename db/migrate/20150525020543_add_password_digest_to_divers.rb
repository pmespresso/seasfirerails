class AddPasswordDigestToDivers < ActiveRecord::Migration
  def change
  	add_column :divers, :password_digest, :string
  end
end
