class GameController < InheritedResources::Base
  
  RIGHT = "right"
  WRONG = "wrong"
  SKIP = "skip"
  TIMEOUT = "timeout"
  TIMER = 30
  DELAY = 3
    
  def level
    @levels = Test.distinctLevels
  end
  
  def play
    set_id
    set_results @id
    
    if @id == 0
      set_level
      @test = Test.selectTest @level
    else
      set_answers
      set_test
    end
    
    @question = @test.questions[@id]
    set_random_animal
    
    if @id < (@test.questions.length - 1)
      @action = :play
    else
      @action = :result
    end
    
    @time = Time.now
  end

  def result
    set_id
    set_answers
    set_results @id
    
    @results_animals = Array.new
    @answers_animals = Array.new
    @quiz_results = Array.new
    @result = 0
    for i in 0...@id
      @results_animals[i] = Animal.find(@results[i])
      if (@answers[i] != SKIP) && (@answers[i] != TIMEOUT)
        @answers_animals[i] = Animal.find(@answers[i])
      end
      
      if @answers[i] == @results[i]
        @result = @result + 3
        @quiz_results[i] = "corretta"
      else
        if @answers[i] == SKIP
          @quiz_results[i] = "saltata"
        else
          if @answers[i] == TIMEOUT
            @result = @result - 1
            @quiz_results[i] = "tempo scaduto"
          else
            @result = @result - 1
            @quiz_results[i] = "errata"
          end
        end
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
  
  def set_test
    @test = Test.find(params[:test_id])
  end
  
  def set_time
    @new_time = Time.now
    @old_time = Time.parse(params[:time])
  end
 
 def set_results id
   @results = Array.new
   for i in 0...id
     @results[i] = params["result_" + i.to_s]
   end
 end
 
 def set_answers
   @answers = Array.new
   for i in 0...@id
     @answers[i] = params["answer_" + i.to_s]
   end
   
   set_time
   if (@new_time - @old_time) < (TIMER + DELAY)
     @answers[@id-1] = params["answer_" + (@id-1).to_s]
   else
     @answers[@id-1] = TIMEOUT
   end
   
   @answers[@id] = params["answer_" + @id.to_s]
 end
 
 def set_random_animal
   if rand(2) == 1
     @results[@id] = @question.animal_1
   else
     @results[@id] = @question.animal_2
   end
 end
  
end