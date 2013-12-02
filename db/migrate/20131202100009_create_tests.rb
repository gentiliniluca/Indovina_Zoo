class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :level

      t.timestamps
    end
  end
end
