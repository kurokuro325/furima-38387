class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item, :explanation, :detail_category_id, :detail_condition_id, :delivery_burden_id,
                                 :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end
