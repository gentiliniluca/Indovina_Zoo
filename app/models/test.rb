class Test < ActiveRecord::Base
  has_many :test_questions 
  has_many :questions, :through => :test_questions
  
  def self.distinctLevels
    Test.order("level ASC").select("distinct level")
  end
  
  def self.selectTest level
    Test.where("level = " + level).order("random()").first
  end
end