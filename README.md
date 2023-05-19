# テーブル設計

## users テーブル

| Column              | Type   | Options                  |
| ------------------  | ------ | -----------------------  |
| email               | string | null: false, unique: true|
| encrypted_password  | string | null: false              |
| name                | string | null: false              |
| birth_day           | date   | null: false              |
| family_name         | string | null: false              |
| first_name          | string | null: false              |
| family_name_reading | string | null: false              |
| first_name_reading  | string | null: false              |

### Association

- has_many :items
- has_many :shops
- has_one  :address

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| content      | text       | null: false                    |
| category_id  | integer    | null: false                    |
| status_id    | integer    | null: false                    |
| payer_id     | integer    | null: false                    |
| location_id  | integer    | null: false                    |
| duration_id  | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :shop

## shops テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| content     | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column        | Type       | Options                        |
| -----------   | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| tel           | string     | null: false                    |
| shop          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :shop
