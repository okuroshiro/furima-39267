FactoryBot.define do
  factory :order_address do
    token { Faker::Alphanumeric.alpha(number: 10) }
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    house_number { Faker::Address.street_address }
    tel { '09012345678' }
  end
end
