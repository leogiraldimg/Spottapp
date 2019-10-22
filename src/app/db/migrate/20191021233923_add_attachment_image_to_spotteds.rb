class AddAttachmentImageToSpotteds < ActiveRecord::Migration[5.2]
  def self.up
    change_table :spotteds do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :spotteds, :image
  end
end
