class AdminsController < InheritedResources::Base
  
  before_action :authenticate_admin!

  protected
  def permitted_params
    params.permit(:admin => [:email, :password, :others])
  end

end
