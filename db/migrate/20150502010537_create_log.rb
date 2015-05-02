class CreateLog < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :title
      t.text :entry
      t.text :place
      t.text :date
      t.integer :rating
    end
  end
end
