class TestQuestion < ActiveRecord::Base

  belongs_to :question
  belongs_to :test
  
  #validates :test, uniqueness: {scope: :question}
end
