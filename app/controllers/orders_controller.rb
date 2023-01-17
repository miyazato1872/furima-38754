class OrdersController < ApplicationController
  before_action :item_find, only: [:index, :create]

  def index
    @order_ship = OrderShip.new
  end

  def create
    @order_ship = OrderShip.new(order_params)
    if @order_ship.valid?
      @order_ship.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_ship).permit(:post_code, :area_id,:city, :address, :building,:phone).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
end
