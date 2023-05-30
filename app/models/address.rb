class Address < ApplicationRecord
  belongs_to :order
  belongs_to :prefecture

  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :city, presence: true
  validates :house_number, presence: true
  validates :building_name
  validates :tel, presence: true, format: { with: /\A\d+\z/, message: "can't be blank" }
end