class Question < ActiveRecord::Base
  belongs_to :animal_1, :class_name => "Animal", :foreign_key => "animal_id_1"
  belongs_to :animal_2, :class_name => "Animal", :foreign_key => "animal_id_2"

  has_many :test_questions 
  has_many :tests, :through => :test_questions

  validates :value, presence: true, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 10 }
  validates :name, presence: true
  
  validates_each :animal_2 do |record, attr, value|
    record.errors.add(attr, ' != Animal 1') if value == record.animal_1
  end
end
