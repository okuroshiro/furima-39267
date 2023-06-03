require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user.id)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end

      it '建物名が空でも保存できる' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'トークンが空だと保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと保存できないこと' do
        @order_address.postal_code = nil
        expect(@order_address).not_to be_valid
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンがないと保存できないこと' do
        @order_address.postal_code = '1234567'
        expect(@order_address).not_to be_valid
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it '都道府県が空だと保存できないこと' do
        @order_address.prefecture_id = nil
        expect(@order_address).not_to be_valid
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空だと保存できないこと' do
        @order_address.city = nil
        expect(@order_address).not_to be_valid
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと保存できないこと' do
        @order_address.house_number = nil
        expect(@order_address).not_to be_valid
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号が空だと保存できないこと' do
        @order_address.tel = nil
        expect(@order_address).not_to be_valid
        expect(@order_address.errors.full_messages).to include("Tel can't be blank")
      end

      it '電話番号にハイフンがあると保存できないこと' do
        @order_address.tel = '090-1234-5678'
        expect(@order_address).not_to be_valid
        expect(@order_address.errors.full_messages).to include('Tel is invalid. Input only numbers')
      end

      it '電話番号が10桁以下だと保存できないこと' do
        @order_address.tel = '123456789'
        expect(@order_address).not_to be_valid
        expect(@order_address.errors.full_messages).to include('Tel is too short')
      end

      it '電話番号が12桁以上でも登録できないこと' do
        @order_address.tel = '090123456789'
        expect(@order_address).not_to be_valid
        expect(@order_address.errors.full_messages).to include('Tel is too short')
      end
    end
  end
end
