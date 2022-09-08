require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  before do
    @purchase_destination = FactoryBot.build(:purchase_destination)
  end

  describe '商品の購入' do
    context '商品が購入できるとき' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@purchase_destination).to be_valid
      end
      it '建物名は空でも購入できる' do
        @purchase_destination.building = nil
        expect(@purchase_destination).to be_valid
      end
    end
      
    context '商品が購入できないとき' do
      it 'user_idが空だと購入できない' do
        @purchase_destination.user_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと購入できない' do
        @purchase_destination.item_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと購入できない' do
        @purchase_destination.postcode = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号にハイフンがないと購入できない' do
        @purchase_destination.postcode = 1234567
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと購入できない' do
        @purchase_destination.prefecture_id = 1
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと購入できない' do
        @purchase_destination.prefecture_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと購入できない' do
        @purchase_destination.city = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できない' do
        @purchase_destination.block = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Block can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @purchase_destination.phone_number = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると購入できない' do
        @purchase_destination.phone_number = '012-345-6789'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is not a number')
      end
      it '電話番号が全角数字だと購入できない' do
        @purchase_destination.phone_number = '０１２３４５６７８９'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is not a number')
      end
      it '電話番号が10桁未満では購入できない' do
        @purchase_destination.phone_number = 123456789
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
      end
      it '電話番号が12桁以上では購入できない' do
        @purchase_destination.phone_number = 123456789012
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'トークンが空だと購入できない' do
        @purchase_destination.token = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end