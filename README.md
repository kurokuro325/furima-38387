# テーブル設計

## users テーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | -------------------------------|
| nickname           | string | null: false                    |
| email              | string | null: false, unique: true,     |
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
| image                  | string     | null: false                    |
| explanation            | text       | null: false                    |
| detail_category_id     | integer    | null: false                    |
| detail_condition_id    | integer    | null: false                    |
| delivery_chages_id     | integer    | null: false                    |
| delivery_area_id       | integer    | null: false                    |
| delivery_day_id        | integer    | null: false                    |
| price                  | integer    | null: false                    |
| profit                 | string     | null: false                    |

- has_many :orders
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
| family_name          | string     | null: false                    |
| first_name           | references | null: false, foreign_key: true |
| family_name_kana     | string     | null: false                    |
| first_name_kana      | string     | null: false                    |
| prefecture           | string     | null: false                    |
| city                 | string     | null: false                    |
| adress1              | string     | null: false                    |
| adress2              | string     | null: false                    |
| number               | string     | null: false                    |
| user                 | references | null: false, foreign_key: true |

- belongs_to :order