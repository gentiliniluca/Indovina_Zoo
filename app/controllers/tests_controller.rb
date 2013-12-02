class TestsController < InheritedResources::Base
protected
  def permitted_params
    params.permit(:test => [:level, :others])
  end
end
