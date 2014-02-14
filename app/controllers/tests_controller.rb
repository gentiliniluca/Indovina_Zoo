class TestsController < InheritedResources::Base
  
  MAX = 3
  
  def create
   
   #test = Test.create(permitted_params_con_select)
   #questions = Question.find(params[:question_id_1], params[:question_id_2], params[:question_id_3])
   
=begin  
   questions.each do |question|
     question.test_questions.create(test_id: test.id)   
   end
=end

   test = Test.new(permitted_params_con_select)

   for i in 1..MAX
     question = Question.find(params["question_id_" + i.to_s])
     test_question = TestQuestion.new
     test_question.question = question 
     test_question.test = test
     test_question.save!
   end
   test.save!

   #redirect_to test_questions_path
   redirect_to tests_path
  end


protected
	
  def permitted_params_con_select
    params.require(:test).permit(:level)
  end

  def permitted_params
    params.permit(:test => [:level, :others])
  end


end
