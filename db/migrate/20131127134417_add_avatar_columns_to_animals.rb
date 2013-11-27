class AddAvatarColumnsToAnimals < ActiveRecord::Migration
  def change
    def self.up
      add_attachment :animals, :avatar
    end
  
    def self.down
      remove_attachment :animals, :avatar
    end
  end
end
