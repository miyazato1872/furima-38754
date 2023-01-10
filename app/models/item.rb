class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :area
  belongs_to :days_to_ship


  belongs_to :user
  has_one_attached :image

  validates :image,               presence: true
  validates :name,                presence: true
  validates :description,         presence: true
  validates :category_id,         presence: true
  validates :status_id,           presence: true
  validates :shipping_charge_id,  presence: true
  validates :area_id,             presence: true
  validates :days_to_ship_id,     presence: true
  validates :price,               presence: true

  
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_charge_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :days_to_ship_id, numericality: { other_than: 1, message: "can't be blank" } 

  validates_inclusion_of :price, in:300..9999999, message: "Price is invalid", allow_blank: true
  validates :price, format: { with: /\A[0-9]+\z/ }, allow_blank: true
end
