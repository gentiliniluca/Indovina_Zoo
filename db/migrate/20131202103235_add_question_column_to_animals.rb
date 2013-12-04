class AddQuestionColumnToAnimals < ActiveRecord::Migration
  def change
#    rename_column :questions, :animal_id, :animal_id_1
    add_reference :questions, :animal, index: true
    rename_column :questions, :animal_id, :animal_id_2 
  end
end
