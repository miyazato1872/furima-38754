# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| last_name             | string | null: false               |
| first_name            | string | null: false               |
| kana_last_name        | string | null: false               |
| kana_first_name       | string | null: false               |
| birth_date            | date   | null: false               |

### Association
- has_many :items
- has_many :orders



## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order
- has_one_attached :image



## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :ship



## ships テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| area_id       | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone         | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
- belongs_to :order