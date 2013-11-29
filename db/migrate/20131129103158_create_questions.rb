class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :value

      t.timestamps
    end
  end
end
