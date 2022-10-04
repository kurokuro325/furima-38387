require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end
  
  describe '商品購入ページの登録' do
    context '商品購入項目の保存ができるとき' do
    it '全ての項目が記入されていれば保存ができること' do
        expect(@order_address).to be_valid
      end
    end
    context '商品購入項目の保存ができないとき' do
    it 'item_idが空だと保存出来ない' do
      @order_address.item_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    it 'user_idが空だと保存出来ない' do
      @order_address.user_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it 'post_codeが空だと保存出来ない' do
      @order_address.post_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeが「3桁ハイフン4桁」の半角文字列出ないと保存出来ない' do
      @order_address.post_code = '/\A[0-9]{3}-[0-9]{4}\z/'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it 'prefecture_idが空だと保存出来ない' do
      @order_address.prefecture_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存出来ない' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it 'address1が空だと保存出来ない' do
      @order_address.address1 = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address1 can't be blank")
    end
    it 'numberが空だと保存出来ない' do
      @order_address.number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Number can't be blank")
    end
    it 'numberが10桁以上11桁以内の半角数値でないと保存出来ない' do
      @order_address.number = '/\A\d{10,11}\z/'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Number is invalid")
    end
  end
end
end
