class Question < ActiveRecord::Base
  belongs_to :animal
  has_many :test_question 
  has_many :tests, :through => :test_questions
end
