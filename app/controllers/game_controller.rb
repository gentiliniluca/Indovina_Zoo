class GameController < InheritedResources::Base
  def level
    @levels = Test.distinctLevels
  end
end