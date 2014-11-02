class ItemsController < ApplicationController

  def new
    puts "NEW"
    @item = Item.new
  end

  def index
    puts "Well?"
    @items = Item.all
  end

  def create
    @item = Item.new(find_params)
    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  def show
    puts "Show"
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(find_params)
      redirect_to @item
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
