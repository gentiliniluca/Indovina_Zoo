class QuestionsController < InheritedResources::Base
  
  before_action :authenticate_admin!
  
  protected
  def permitted_params
    params.permit(:question => [:value, :animal_id_1, :animal_id_2, :name, :others])
  end
end
