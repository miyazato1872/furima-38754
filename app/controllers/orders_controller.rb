class OrdersController < ApplicationController
  before_action :item_find, only: [:index, :create]
  before_action :authenticate_user!
  before_action :correct_order, only: [:index, :create]

  def index
    @order_ship = OrderShip.new
  end

  def create
    @order_ship = OrderShip.new(order_params)
    if @order_ship.valid?
      pay_item
      @order_ship.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_ship).permit(:post_code, :area_id, :city, :address, :building, :phone).merge(item_id: params[:item_id],
                                                                                                       user_id: current_user.id, token: params[:token])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def correct_order
    return unless Order.exists?(item_id: @item) || @item.user_id == current_user.id

    redirect_to root_path
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を環境変数に設定した記述
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price, # 商品の値段 priceをitem_idの中からどうやって取得するかが重要。書き方はこれを参考にする
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
