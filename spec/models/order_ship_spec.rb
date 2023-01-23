require 'rails_helper'
RSpec.describe OrderShip, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_ship = FactoryBot.build(:order_ship, user_id: user.id, item_id: item.id)
    sleep(0.05)
  end

  describe '商品購入登録' do
    context '商品購入登録ができるとき' do
      it 'すべての入力値が適切な状態で存在すれば購入登録ができる' do
        expect(@order_ship).to be_valid
      end

      it 'building以外のすべての入力値が適切な状態で存在すれば購入登録ができる' do
        @order_ship.building = ''
        expect(@order_ship).to be_valid
      end
    end

    context '商品購入登録ができないとき' do
      it 'post_codeが空では登録できない' do
        @order_ship.post_code = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("郵便番号を入力してください")
      end

      it 'post_codeは、「3桁ハイフン4桁」の半角文字列で入力しないと登録できない' do
        @order_ship.post_code = '1234567'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('郵便番号はハイフンを使用して正しく入力してください')
      end

      it 'area_idが空では登録できない' do
        @order_ship.area_id = '1'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("都道府県を選択してください")
      end

      it 'cityが空では登録できない' do
        @order_ship.city = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("市区町村を入力してください")
      end

      it 'addressが空では登録できない' do
        @order_ship.address = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("番地を入力してください")
      end

      it 'phoneが空では登録できない' do
        @order_ship.phone = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("電話番号を入力してください")
      end

      it 'phoneが9桁以下では登録できない' do
        @order_ship.phone = '123456789'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('電話番号が不正な値です。正しく入力してください。')
      end

      it 'phoneが12桁以上では登録できない' do
        @order_ship.phone = '1234567890123'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('電話番号が不正な値です。正しく入力してください。')
      end

      it 'phoneが半角数値以外で入力されると登録できない' do
        @order_ship.phone = '０９０１２３４５６７８'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('電話番号が不正な値です。正しく入力してください。')
      end

      it 'phoneはハイフンをつけると登録できない' do
        @order_ship.phone = '03-123-5678'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include('電話番号が不正な値です。正しく入力してください。')
      end

      it 'tokenが空では登録できない' do
        @order_ship.token = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("正しいクレジットカード情報を入力してください")
      end

      it 'user_idが空だと登録できない' do
        @order_ship.user_id = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("ユーザーを入力してください")
      end

      it 'item_idが空だと登録できない' do
        @order_ship.item_id = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("アイテムを入力してください")
      end
    end
  end
end
