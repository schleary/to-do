class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
     @item = Item.new
  end

  def create
    @item = Item.new(find_params)
    if @item.save
      redirect_to items_path(@item)
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(find_params)
      redirect_to items_show_path(@item)
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private

  def find_params
    params.require(:item).permit(:name, :description)
  end

end
