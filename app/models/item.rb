class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :payer
  belongs_to :prefecture
  belongs_to :duration


  validates :image, presence: true
  validates :item_name, presence: true 
  validates :content, presence: true
  validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :payer_id, numericality: { other_than: 0, message: "can't be blank" } 
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :duration_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: " is invalid. Input half-width characters"},
  inclusion: {in: 300..9999999, message: "is out of setting range"}
  
end
