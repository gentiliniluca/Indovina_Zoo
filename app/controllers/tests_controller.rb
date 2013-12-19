class TestsController < InheritedResources::Base
  def create
   test = Test.create(permitted_params_con_select)
   questions = Question.find(params[:question_id_1], params[:question_id_2], params[:question_id_3])

   questions.each do |question|
     question.test_questions.create(test_id: test.id)   
    end

   redirect_to test_questions_path
  end


protected
	
  def permitted_params_con_select
    params.require(:test).permit(:level)
  end

  def permitted_params
    params.permit(:test => [:level, :others])
  end


end
