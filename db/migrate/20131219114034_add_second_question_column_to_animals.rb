class AddSecondQuestionColumnToAnimals < ActiveRecord::Migration
  def change
    add_reference :questions, :animal, index: true
    rename_column :questions, :animal_id, :animal_id_1
  end
end
