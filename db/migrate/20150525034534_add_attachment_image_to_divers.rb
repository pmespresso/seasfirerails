class AddAttachmentImageToDivers < ActiveRecord::Migration
  def self.up
    change_table :divers do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :divers, :image
  end
end
