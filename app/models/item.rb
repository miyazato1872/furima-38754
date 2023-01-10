class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :area
  belongs_to :days_to_ship


  belongs_to :user
  has_one_attached :image

  validates :category_id, :text, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  
  validates :status_id, :text, presence: true
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" } 
  
  validates :shipping_charge_id, :text, presence: true
  validates :shipping_charge_id, numericality: { other_than: 1, message: "can't be blank" } 
  
  validates :area_id, :text, presence: true
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" } 
  
  validates :days_to_ship_id, :text, presence: true
  validates :days_to_ship_id, numericality: { other_than: 1, message: "can't be blank" } 
  
end
