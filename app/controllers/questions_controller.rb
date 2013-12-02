class QuestionsController < InheritedResources::Base
  protected
  def permitted_params
    params.permit(:question => [:value, :animal_id, :name, :others])
  end
end
