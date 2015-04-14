
class IndexController < ApplicationController
  include IndexHelper
  
  def index
    @gem_item = GemItem.find("6")
  end
  
  def roll
    
  end


end
