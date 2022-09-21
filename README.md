# テーブル設計

## users テーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | -------------------------------|
| nickname           | string | null: false, foreign_key: true |
| email              | string | null: false, unique: true,     |
| encrypted_password | string | null: false                    |
| introduction       | string | null: false                    |
| family_name        | string | null: false                    |
| first_name         | string | null: false                    |
| family_name_kana   | string | null: false                    |
| first_name_kana    | string | null: false                    |
| birthday           | string | null: false                    |

- has_many :items 
- has_many :records
- has_many  :cards

## items テーブル

| Column               | Type       | Options                        |
| ------------------   | ---------- | ------------------------------ |
| item_name            | string     | null: false                    |
| user_id              | references | null: false, foreign_key: true |
| price                | string     | null: false                    |
| category             | string     | null: false                    |
| commodity_condition  | string     | null: false                    |
| seller               | string     | null: false                    |

- has_many :records
- has_many :images
- has_many :categories
- belongs_to :user

##  Records テーブル

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| item_name            | string     | null: false                    |
| user_id              | references | null: false, foreign_key: true |
| price                | string     | null: false                    |
| date                 | string     | null: false                    |
| category             | string     | null: false                    |
| shipping_chage       | string     | null: false                    |
| prefecture           | string     | null: false                    |
| shipping_date        | string     | null: false                    |

- has_many :adresses
- belongs_to :user
- belongs_to :item
- has_one  :address

##  Adresses テーブル

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
| user_id              | references | null: false, foreign_key: true |

- has_many :users
- has_many :items
- belongs_to :item

##  cards テーブル

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| user_id              | references | null: false, foreign_key: true |
| customer_id          | string     | null: false,                   |
| card_id              | string     | null: false,                   |

- belongs_to :user

##  images テーブル

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| image                | string     | null: false,                   |
| item_id              | integer    | null: false, foreign_key: true |

- belongs_to :item

##  categories  テーブル

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| name                 | string     | null: false,                   |

- belongs_to :item