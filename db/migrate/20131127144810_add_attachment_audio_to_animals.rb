class AddAttachmentAudioToAnimals < ActiveRecord::Migration
  def self.up
    change_table :animals do |t|
      t.attachment :audio
    end
  end

  def self.down
    drop_attached_file :animals, :audio
  end
end
