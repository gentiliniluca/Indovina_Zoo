class GameController < InheritedResources::Base
  def level
    @levels = Test.distinctLevels
  end
  
  def play
    set_id
    if @id == 0
      set_level
      @test = Test.selectTest @level
      @question = @test.questions[0]
      if rand(2) == 1
        @result_animal = @question.animal_1
      else
        @result_animal = @question.animal_2
      end
    else
      @test = Test.find(params[:test_id])
      @question = @test.questions[@id]
      if rand(2) == 1
        @result_animal = @question.animal_1
      else
        @result_animal = @question.animal_2
      end
    end
    @id = @id + 1
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
  
  def set_id
    @id = params[:id].to_i
  end
  
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