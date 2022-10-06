require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品の購入' do
    context '商品の購入ができるとき' do
      it '全ての項目が記入されていれば購入ができること' do
        expect(@order_address).to be_valid
      end
      it 'tokenがあれば購入ができること' do
        expect(@order_address).to be_valid
      end
      it '建物名は空でも保存できること' do
        expect(@order_address).to be_valid
      end
    end
    context '商品購入ができないとき' do
      it 'item_idが空だと購入出来ない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空だと購入出来ない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'post_codeが空だと購入出来ない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが「3桁ハイフン4桁」の半角文字列出ないと購入出来ない' do
        @order_address.post_code = '/\A[0-9]{3}-[0-9]{4}\z/'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが空だと購入出来ない' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入出来ない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'address1が空だと購入出来ない' do
        @order_address.address1 = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address1 can't be blank")
      end
      it 'numberが空だと購入出来ない' do
        @order_address.number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Number can't be blank")
      end
      it '電話番号が9桁以下では購入できない' do
        @order_address.number = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Number is invalid')
      end
      it '電話番号が12桁以上では購入できない' do
        @order_address.number = '090123456786'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Number is invalid')
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @order_address.number = '090123456８い'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Number is invalid')
      end
      it 'tokenが空では購入できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
