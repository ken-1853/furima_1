class OrdersController < ApplicationController

  before_action :set_item
  before_action :sold_out
  before_action :authenticate_user!

  # redirect_to action: :indexにしてしまうと、orderコントローラーのindexに飛んでしまう

  def index
    @item_order = PayForm.new
  end

  def create
    @item_order = PayForm.new(item_order_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      # PayForm.newを使ってるけど、DBにあるわけじゃない。PayFormモデルに行って自作のsaveメソッドを呼んでくる
      redirect_to root_path
    else
      render 'index'
    end
  end

 private

  def item_order_params
    # 入力フォームで送られてくる情報はaddressだけだけど、
    # フォームの情報をもとにaddressモデルとordersモデルの２つに情報を保存している
    params.permit(
      :token,
      :postal_code,
      :prefecture_id,
      :city,
      :addresses,
      :building,
      :phone_number,
      :item_id
    ).merge(user_id: current_user.id)
    # なぜmergeでは:item_idとだけ記載？params[:item_id]では？
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item  #PAY.JP側に決済情報を送信する
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    # 環境変数のから秘密鍵の情報を呼び出し（認証に使用する
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: item_order_params[:token],   # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def sold_out
    if @item.order != nil
      redirect_to item_path(@item.id)
    end
  end

end
