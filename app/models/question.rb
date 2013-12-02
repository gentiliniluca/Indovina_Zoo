class Question < ActiveRecord::Base
  belongs_to :animal_1, :class_name => "Animal", :foreign_key => "animal_id_1"
  belongs_to :animal_2, :class_name => "Animal", :foreign_key => "animal_id_2"
  #has_many :test_question 
  has_many :tests, :through => :test_questions
end
