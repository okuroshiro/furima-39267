# テーブル設計

## users テーブル

| Column              | Type   | Options                 |
| ------------------  | ------ | ----------------------- |
| email               | string | null: false, ユニーク制約|
| encrypted_password  | string | null: false             |
| name                | string | null: false             |
| nickname            | string | null: false             |
| birth_year          | string | null: false             |
| birth_month         | string | null: false             |
| birth_day           | string | null: false             |
| family_name         | string | null: false             |
| first_name          | string | null: false             |
| family_name_reading | string | null: false             |
| first_name_reading  | string | null: false             |

### Association

- has_many :items
- has_many :shops
- has_one  :address

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| image        | string     | null: false                    |
| content      | text       | null: false                    |
| category     | string     | null: false                    |
| status       | string     | null: false                    |
| payer        | string     | null: false                    |
| location     | string     | null: false                    |
| duration     | string     | null: false                    |
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
| items       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column        | Type       | Options                        |
| -----------   | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |
| tel           | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :shop
