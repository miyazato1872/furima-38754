# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false,              |
| email                 | string | null: false, unique: true |
| password              | string | null: false               |
| password_confirmation | string | null: false               |
| last_name             | string | null: false               |
| first_name            | string | null: false               |
| kana_last_name        | string | null: false               |
| kana_first_name       | string | null: false               |
| birth_date            | date   | null: false               |

### Association
- has_many :items
- has_many :orders


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| shipping_charge | string     | null: false                    |
| area            | string     | null: false                    |
| days_to_ship    | string     | null: false                    |
| price           | integer    | null: false                    |
| users_id        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order
- has_one_attached :image



## orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| users_id   | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :ship



## ships テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| post_code  | string     | null: false                    |
| prefecture | string     | null: false, foreign_key: true |
| city       | string     | null: false, foreign_key: true |
| address    | string     | null: false, foreign_key: true |
| building   | string     | null: false, foreign_key: true |
| phone      | string     | null: false, foreign_key: true |
| orders_id  | references | null: false, foreign_key: true |

### Association
- belongs_to :order