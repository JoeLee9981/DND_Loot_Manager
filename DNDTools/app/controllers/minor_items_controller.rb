class MinorItemsController < ApplicationController
  def new
    @minor_item = MinorItem.new
  end
  
  def create
    @minor_item = MinorItem.new(minor_params)
    
    
    if @minor_item.save
      redirect_to @minor_item
    else
      render 'new'
    end
  end
  
  def show
    @minor_item = MinorItem.find(params[:id])
  end
  
  def edit
    @minor_item = MinorItem.find(params[:id])
  end
  
  def index
    @minor_items = MinorItem.all
  end
  
  def update
    @minor_item = MinorItem.find(params[:id])
    
    if @minor_item.update(minor_params)
      redirect_to @minor_item
    else
      render 'edit'
    end
  end
  
  def destroy
    @minor_item = MinorItem.find(params[:id])
    @minor_item.destroy
    
    redirect_to minor_items_path
  end
  
  private
    def minor_params
      params.require(:minor_item).permit(:name, :low, :high, :avg_val)
    end
end
