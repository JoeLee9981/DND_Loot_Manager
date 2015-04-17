class WeaponItemsController < ApplicationController
  
  def index
    @weapon_items = WeaponItem.all
  end
  
  def new
    @weapon_item = WeaponItem.new
  end
  
  def create
    @weapon_item = WeaponItem.new(weapon_params)
    
    @weapon_item.save
    redirect_to @weapon_item
  end
  
  def show
    @weapon_item = WeaponItem.find(params[:id])
  end
  
   def edit
    @weapon_item = WeaponItem.find(params[:id])
  end
  
  def update
    @weapon_item = WeaponItem.find(params[:id])
    
    if @weapon_item.update(weapon_params)
      redirect_to @weapon_item
    else
      render 'edit'
    end
  end
  
  def destroy
    @weapon_item = WeaponItem.find(params[:id])
    @weapon_item.destroy
    
    redirect_to weapon_items_path
  end
  
  private
    def weapon_params
      params.require(:weapon_item).permit(:name, :low, :high, :avg_val)
    end
end
