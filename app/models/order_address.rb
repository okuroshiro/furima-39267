class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :tel, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :tel
    validates :user_id
    validates :item_id
  end

  validates :tel, length: { minimum: 10, message: 'is too short' }
  validates :tel, format: { with: /\A\d+\z/, message: 'is invalid. Input only numbers' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id, token: token)
    if order.valid?
      order.save
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                     building_name: building_name, tel: tel, order_id: order.id)
    else
      false
    end
  end

  def user
    User.find_by(id: user_id)
  end
end
