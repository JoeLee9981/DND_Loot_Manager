
class IndexController < ApplicationController
  include IndexHelper
  
  def index
    @gem_items = GemItem.all
  end
  
  def roll
    
  end


end
