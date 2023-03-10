class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :correct_item, only: [:edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    return if @item.order.nil?

    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :shipping_charge_id, :area_id,
                                 :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def correct_item
    return if @item.user.id == current_user.id

    redirect_to root_path
  end

  def item_find
    @item = Item.find(params[:id])
  end
end
