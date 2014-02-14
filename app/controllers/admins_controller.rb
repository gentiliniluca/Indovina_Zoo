class AdminsController < InheritedResources::Base

  protected
  def permitted_params
    params.permit(:admin => [:email, :password, :others])
  end

end
