class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :payer
  belongs_to :prefecture
  belongs_to :duration

  validates :item_name, presence: true 
  validates :content, presence: true
  validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :payer_id, numericality: { other_than: 0, message: "can't be blank" } 
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :duration_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :price, presence: true
  validates :image, presence: true
end
