class Test < ActiveRecord::Base
  
  #has_many :test_question 
  has_many :questions, :through => :test_questions
end
