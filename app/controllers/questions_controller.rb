class QuestionsController < InheritedResources::Base
  protected
  def permitted_params
    params.permit(:question => [:value, :animal_id_1, :animal_id_2, :name, :others])
  end
end
