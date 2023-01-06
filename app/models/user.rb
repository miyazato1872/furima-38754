class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :nickname, presence: true  #空では登録できない
  validates :last_name, presence: true  #空では登録できない
  validates :first_name, presence: true  #空では登録できない
  validates :kana_last_name, presence: true   #空では登録できない
  validates :kana_first_name, presence: true   #空では登録できない
  validates :birth_date, presence: true  #空では登録できない

  validates_format_of :last_name, with: /\A[ぁ-んァ-ン一-龥]/, allow_blank: true   #全角（漢字・ひらがな・カタカナ）での入力が必須
  validates_format_of :first_name, with: /\A[ぁ-んァ-ン一-龥]/, allow_blank: true   #全角（漢字・ひらがな・カタカナ）での入力が必須

  validates_format_of  :kana_last_name, with:  /\A[ァ-ヶー－]+\z/, allow_blank: true  #全角（カタカナ）での入力が必須
  validates_format_of  :kana_first_name, with:  /\A[ァ-ヶー－]+\z/, allow_blank: true  #全角（カタカナ）での入力が必須

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }, allow_blank: true  #半角英数字混合での入力が必須
end
