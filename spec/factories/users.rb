FactoryBot.define do
  factory :user do
    name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {"a1" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birth_day {Faker::Date.between(from: '1930-01-01', to: '2018-12-31')}

    japanese_user = Gimei.name
    family_name {japanese_user.last.kanji}
    first_name {japanese_user.first.kanji}
    family_name_reading {japanese_user.last.katakana}
    first_name_reading {japanese_user.first.katakana}
  end
end