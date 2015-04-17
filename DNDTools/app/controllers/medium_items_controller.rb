class MediumItemsController < ApplicationController
  def new
    @medium_item = MediumItem.new
  end
  
  def create
    @medium_item = MediumItem.new(medium_params)
    
    
    if @medium_item.save
      redirect_to @medium_item
    else
      render 'new'
    end
  end
  
  def show
    @medium_item = MediumItem.find(params[:id])
  end
  
  def edit
    @medium_item = MediumItem.find(params[:id])
  end
  
  def index
    @medium_items = MediumItem.all
  end
  
  def update
    @medium_item = MediumItem.find(params[:id])
    
    if @medium_item.update(medium_params)
      redirect_to @medium_item
    else
      render 'edit'
    end
  end
  
  def destroy
    @medium_item = MediumItem.find(params[:id])
    @medium_item.destroy
    
    redirect_to medium_items_path
  end
  
  private
    def medium_params
      params.require(:medium_item).permit(:name, :low, :high, :avg_val)
    end
end
