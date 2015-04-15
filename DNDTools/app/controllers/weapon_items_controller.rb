class WeaponItemsController < ApplicationController
  
  def index
    @weapon_items = WeaponItems.all
  end
  
  def create
    @weapon_item = WeaponItems.new(weapon_params)
    
    @weapon_item.save
    redirect_to @weapon_item
  end
  
  def show
    @weapon_item = WeaponItem.find(params[:id])
  end
  
  private
    def weapon_params
      params.require(:weapon_item).permit(:name, :low, :high, :avg_val)
    end
end
