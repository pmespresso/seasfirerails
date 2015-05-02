class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :title
      t.text :place
      t.text :date
      t.text :entry
      t.integer :rating

      t.timestamps null: false
    end
  end

end
