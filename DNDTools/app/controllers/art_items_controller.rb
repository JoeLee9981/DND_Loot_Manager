class ArtItemsController < ApplicationController
  def new
    @art_item = ArtItem.new
  end
  
  def create
    @art_item = ArtItem.new(art_params)
    
    
    if @art_item.save
      redirect_to @art_item
    else
      render 'new'
    end
  end
  
  def show
    @art_item = ArtItem.find(params[:id])
  end
  
  def edit
    @art_item = ArtItem.find(params[:id])
  end
  
  def index
    @art_items = ArtItem.all
  end
  
  def update
    @art_item = ArtItem.find(params[:id])
    
    if @art_item.update(art_params)
      redirect_to @art_item
    else
      render 'edit'
    end
  end
  
  def destroy
    @art_item = ArtItem.find(params[:id])
    @art_item.destroy
    
    redirect_to art_items_path
  end
  
  private
    def art_params
      params.require(:art_item).permit(:name, :low, :high, :avg_val)
    end
end
