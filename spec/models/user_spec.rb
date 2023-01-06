require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      # nicknameが空では登録できないテストコードを記述します
    end

    it 'emailが空では登録できない' do
      # emailが空では登録できないテストコードを記述します
    end

    it 'passwordが空では登録できない' do

    end
    
    it 'last_nameが空では登録できない' do

    end

    it 'first_nameが空では登録できない' do

    end

    it 'kana_last_nameが空では登録できない' do

    end

    it 'kana_first_nameが空では登録できない' do

    end

    it 'birth_dateが空では登録できない' do

    end

    it 'emailが一意性ではなければ登録できない' do

    end

    it 'emailに、@が含まれていないと登録できない' do

    end

    it 'passwordが6文字以上でないと登録できない' do

    end

    it 'PasswordとPassword confirmationが一致しないと登録ができない' do

    end

    it 'last_nameは、全角（漢字・ひらがな・カタカナ）で入力しなければ登録できない' do

    end

    it 'first_nameは、全角（漢字・ひらがな・カタカナ）で入力しなければ登録できない' do

    end

    it 'kana_last_nameは全角（カタカナ）で入力しなければ登録できない' do

    end

    it 'kana_first_nameは全角（カタカナ）で入力しなければ登録できない' do

    end

    it 'passwordは、半角英数字混合での入力をしなければ登録できない' do

    end

  end
end