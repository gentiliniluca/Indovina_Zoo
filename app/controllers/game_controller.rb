class GameController < InheritedResources::Base
  def level
    @levels = Test.distinctLevels
  end
  
  def play
    set_level
    @test = Test.selectTest @level
    @questions = @test.questions
    
    @animals = Hash.new
    @questions.each do |question|
      if rand(2) == 1
        @animals[question] = question.animal_1
      else
        @animals[question] = question.animal_2
      end
    end
  end
  
  def result
    set_answer
    
    @result = 0
    @keys = @answers.keys
    @keys.each do |key|
      if @answers[key] == @results[key]
        @result = @result + 10
      end
    end
  end
  
  private
  
  def set_level
    @level = params[:level]
  end
  
  def set_answer
    @keys = params.keys
    @answers = Hash.new
    @results = Hash.new
    @keys.each do |key|
      if key[0..6] == "result_"
        @results[key[7..key.length]] = params[key]
      else
        @answers[key] = params[key]
      end
    end
  end
  
end