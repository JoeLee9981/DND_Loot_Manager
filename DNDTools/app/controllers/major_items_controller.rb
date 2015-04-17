class MajorItemsController < ApplicationController
  def new
    @major_item = MajorItem.new
  end
  
  def create
    @major_item = MajorItem.new(major_params)
    
    
    if @major_item.save
      redirect_to @major_item
    else
      render 'new'
    end
  end
  
  def show
    @major_item = MajorItem.find(params[:id])
  end
  
  def edit
    @major_item = MajorItem.find(params[:id])
  end
  
  def index
    @major_items = MajorItem.all
  end
  
  def update
    @major_item = MajorItem.find(params[:id])
    
    if @major_item.update(major_params)
      redirect_to @major_item
    else
      render 'edit'
    end
  end
  
  def destroy
    @major_item = MajorItem.find(params[:id])
    @major_item.destroy
    
    redirect_to major_items_path
  end
  
  private
    def major_params
      params.require(:major_item).permit(:name, :low, :high, :avg_val)
    end
end
