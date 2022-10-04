class OrdersController < ApplicationController

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end
  
  def new
    @order_address = OrderAddress.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = "sk_test_46fbbd0c474ff3bc649a567f"  
      Payjp::Charge.create(
        amount: @item[:price],
        card: order_params[:token],    
        currency: 'jpy'                 
      )
       @order_address.save
       redirect_to items_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :address1, :address2, :number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end
