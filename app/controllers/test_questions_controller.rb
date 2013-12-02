class TestQuestionsController < InheritedResources::Base
protected
  def permitted_params
    params.permit(:test_question => [:question_id, :test_id, :others])
  end
end
