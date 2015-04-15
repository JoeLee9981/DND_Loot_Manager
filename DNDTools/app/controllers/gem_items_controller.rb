class GemItemsController < ApplicationController
  def new
    @gem_item = GemItem.new
  end
  
  def create
    @gem_item = GemItem.new(gem_params)
    
    if @gem_item.save
        redirect_to @gem_item
    else
      render 'new'
    end
  end
  
  def show
    @gem_item = GemItem.find(params[:id])
  end
  
  def edit
    @gem_item = GemItem.find(params[:id])
  end
  
  def index
    @gem_items = GemItem.all
  end
  
  def update
    @gem_item = GemItem.find(params[:id])
    
    if @gem_item.update(gem_params)
      redirect_to @gem_item
    else
      render 'edit'
    end
  end
  
  def destroy
    @gem_item = GemItem.find(params[:id])
    @gem_item.destroy
    
    redirect_to gem_items_path
  end
  
  private
    def gem_params
      params.require(:gem_item).permit(:name, :low, :high, :avg_val)
    end
end
