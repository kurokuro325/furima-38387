require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品ページの登録' do
    context '商品出品ができるとき' do
      it '必須項目が全てあれば出品できること' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができないとき' do
      it 'imageが空だと出品出来ない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'itemが空だと出品出来ない' do
        @item.item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item can't be blank")
      end
      it 'explanationが空だと出品出来ない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'detail_category_idが空だと出品出来ない' do
        @item.detail_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail category can't be blank")
      end
      it 'delivery_burden_idが空だと出品出来ない' do
        @item.delivery_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery burden can't be blank")
      end
      it 'prefecture_idが空だと出品出来ない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'delivery_day_idが空だと出品出来ない' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it 'priceが空だと出品出来ない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下だと登録できないこと' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが10000000だと登録できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'detail_category_idが1だと登録できないこと' do
        @item.detail_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail category can't be blank")
      end
      it 'detail_category_idが1だと登録できないこと' do
        @item.detail_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail condition can't be blank")
      end
      it 'delivery_burden_idが1だと登録できないこと' do
        @item.delivery_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery burden can't be blank")
      end
      it 'prefecture_idが1だと登録できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'delivery_day_idが1だと登録できないこと' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
    end
  end
end
