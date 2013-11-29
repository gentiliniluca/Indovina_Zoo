class AddAnimalColumnToQuestions < ActiveRecord::Migration
  def change
    change_table :questions do |t|
      t.belongs_to :animal
    end
  end
end
