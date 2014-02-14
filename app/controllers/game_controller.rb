class GameController < InheritedResources::Base
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
  end

=begin
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
=end

  def result
    set_id
    set_answers
    set_results @id
    
    @result = 0
    for i in 0...@id
      if @answers[i] == @results[i]
        @result = @result + 1
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
  
=begin
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
=end
 
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