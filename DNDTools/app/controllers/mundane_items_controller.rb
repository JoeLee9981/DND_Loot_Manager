class MundaneItemsController < ApplicationController
  def new
    @mundane_item = MundaneItem.new
  end
  
  def create
    @mundane_item = MundaneItem.new(mundane_params)
    
    
    if @mundane_item.save
      redirect_to @mundane_item
    else
      render 'new'
    end
  end
  
  def show
    @mundane_item = MundaneItem.find(params[:id])
  end
  
  def edit
    @mundane_item = MundaneItem.find(params[:id])
  end
  
  def index
    @mundane_items = MundaneItem.all
  end
  
  def update
    @mundane_item = MundaneItem.find(params[:id])
    
    if @mundane_item.update(mundane_params)
      redirect_to @mundane_item
    else
      render 'edit'
    end
  end
  
  def destroy
    @mundane_item = MundaneItem.find(params[:id])
    @mundane_item.destroy
    
    redirect_to mundane_items_path
  end
  
  private
    def mundane_params
      params.require(:mundane_item).permit(:name, :low, :high, :sub_low, :sub_high, :avg_val)
    end
end
