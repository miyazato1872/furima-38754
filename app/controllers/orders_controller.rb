class OrdersController < ApplicationController
  def index
    @order_ship = OrderShip.new
  end

  def create
    @order_ship = OrderShip.new(order_params)
    if @order_ship.valid?
      @order_ship.save
      redirect_to root_path
    else
      render :index    ##ここ、indexでいいかあとで確認
    end
  end

  private

  def order_params
    params.require(:order_ship).permit(:post_code, :area_id,:city, :address, :building,:phone).merge(item_id: params[:item_id], user_id: current_user.id)
  end

end
