class ItemsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_collect_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render  new_item_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      @item = Item.new(item_params)
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      @item = Item.new(item_params)
      render :edit
    end
  end


  private
  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :info, 
      :category_id, 
      :sales_status_id,
      :shipping_fee_status_id,
      :prefecture_id,
      :scheduled_delivery_id,
      :price
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def check_collect_user
    unless user_signed_in? && current_user.id == @item.user.id
      redirect_to action: :index
    end
  end

end