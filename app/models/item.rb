class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :item_name, presence: true 
  validates :content, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :payer_id, presence: true 
  validates :prefecture_id, presence: true
  validates :duration_id, presence: true
  validates :price, presence: true
  validates :image, presence: true
end
