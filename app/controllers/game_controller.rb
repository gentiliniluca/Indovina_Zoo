class GameController < InheritedResources::Base
  def level
    @levels = Test.distinctLevels
  end
  
  def play
    
  end
end