require 'rails_helper'
RSpec.describe OrderShip, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_ship = FactoryBot.build(:order_ship, user_id: user.id, item_id: item.id)
  end

  describe '商品購入登録' do
    context '商品購入登録ができるとき' do
      it '全ての入力値が存在すれば登録できる' do
        expect(@order_ship).to be_valid
      end
    end
    
    context '商品購入登録ができないとき' do
      it '  ' do
        @order_ship.  =''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("  ")
      end

      it '  ' do
        @order_ship.  =''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("  ")
      end

      it '  ' do
        @order_ship.  =''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("  ")
      end

      it '  ' do
        @order_ship.  =''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("  ")
      end    
      
      it '  ' do
        @order_ship.  =''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("  ")
      end
      
      it '  ' do
        @order_ship.  =''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("  ")
      end
      
      it '  ' do
        @order_ship.  =''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("  ")
      end
      
      it '  ' do
        @order_ship.  =''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("  ")
      end
      
      it '  ' do
        @order_ship.  =''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("  ")
      end
      
      it '  ' do
        @order_ship.  =''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("  ")
      end
          
      it '  ' do
        @order_ship.  =''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("  ")
      end
          
      it '  ' do
        @order_ship.  =''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("  ")
      end
    end
  end
end

