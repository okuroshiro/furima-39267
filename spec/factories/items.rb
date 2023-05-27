FactoryBot.define do
  factory :item do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'mushi_kabutomushi.png'), 'image/png') }
    item_name { '商品名' }
    content { '商品の説明文' }
    category_id { 1 }
    status_id { 1 }
    payer_id { 1 }
    prefecture_id { 1 }
    duration_id { 1 }
    price { 10_000 }
    association :user
  end
end
