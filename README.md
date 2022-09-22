# テーブル設計

## users テーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | -------------------------------|
| nickname           | string | null: false                    |
| email              | string | null: false, unique: true      |
| encrypted_password | string | null: false                    |
| family_name        | string | null: false                    |
| first_name         | string | null: false                    |
| family_name_kana   | string | null: false                    |
| first_name_kana    | string | null: false                    |
| birthday           | date   | null: false                    |

- has_many :items 
- has_many :orders

## items テーブル

| Column                 | Type       | Options                        |
| ------------------     | ---------- | ------------------------------ |
| item                   | string     | null: false                    |
| explanation            | text       | null: false                    |
| detail_category_id     | integer    | null: false                    |
| detail_condition_id    | integer    | null: false                    |
| delivery_burden_id     | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| delivery_day_id        | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

- has_one :order
- belongs_to :user

##  orders テーブル

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| item                 | references | null: false, foreign_key: true |
| user                 | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one  :address

##  Addresses テーブル

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| post_code            | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| city                 | string     | null: false                    |
| address1             | string     | null: false                    |
| address2             | string     |                                |
| number               | integer    | null: false                    |
| order                | references | null: false, foreign_key: true |

- belongs_to :order