## users(admin) テーブル (講師用)

| column            | Type      | Options                 |
| ----------------- | --------- | ----------------------- |
| nickname          | string    |null: false              |
| email             | string    |null: false,unique: true |
| encrypted_password| string    |null: false              |
| name              | string    |null: false              |
| name_kana         | string    |null: false              |
| birth_date        | string    |null: false              |
| prefecture_id     | integer   |null: false              |
| city_block        | string    |null: false              |
| station           | string    |                         |

- has_many :admins ,thorough: :admin_customers
- has_many :reviews
- has_many :calenders
- has_many :reservers
- has_many :settings

*Action Hash*
- belongs_to_active_hash :prefecture


## users(customer) テーブル (生徒用)

| column            | Type      | Options                     |
| ----------------- | --------- | --------------------------- |
| nickname          | string    |null: false                  |
| email             | string    |null: false,unique: true     |
| encrypted_password| string    |null: false                  |
| name              | string    |null: false                  |
| name_kana         | string    |null: false                  |
| birth_date        | string    |null: false                  |
| prefecture_id     | integer   |null: false                  |
| city_block        | string    |null: false                  |
| station           | string    |                             |
| admin_code        | string    |null:false                   |
| admin             | references|null: false,foreign_key: true|

- has_many :admins ,thorough: :admin_customers
- has_many :reviews
- has_many :reservers
- has_many :purchases

*Action Hash*
- belongs_to_active_hash :prefecture

## admin_customer (中間テーブル)
| column            | Type      | Options                     |
| ----------------- | --------- | --------------------------- |
| admin             | references|null: false,foreign_key: true|
| customer          | references|null: false,foreign_key: true|

- belongs_to :user
- belongs_to :customer


## Reviews テーブル (記録投稿機能)
| column            | Type      | Options                       |
| ----------------- | --------- | ----------------------------- |
| title             | string    | null: false                   |
| text              | string    | null: false                   |
| home_work         | string    | null: false                   |
| information       | string    | null: false                   |
| customer          | references| null: false,foreign_key: true |
| admin             | references| null: false,foreign_key: true |

- belongs_to :admin
- belongs_to :customer

## Calenders テーブル (予定設定機能)
| column            | Type      | Options                      |
| ----------------- | --------- | ---------------------------- |
| time_date_id      | integer   | null: false                  |
| reserver          | references| null: false,foreign_key: true|
| admin             | references| null: false,foreign_key: true|

- belongs_to :admin
- has_many :reservers

## Reserves テーブル (予定登録機能)
| column            | Type      | Options                      |
| ----------------- | --------- | ---------------------------- |
| time_date_id      | integer   | null: false                  |
| calender          | references| null: false,foreign_key: true|
| customer          | references| null: false,foreign_key: true|

- belongs_to :admin
- belongs_to :customer
- belongs_to :calender


## Settings テーブル (購入金額設定機能)
| column            | Type      | Options                      |
| ----------------- | --------- | ---------------------------- |
| level_id          | string    | null: false                  |
| price             | integer   | null: false                  |
| admin             | references| null: false,foreign_key: true|
| purchase          | references| null: false,foreign_key: true|

- belongs_to :admin
- belongs_to :purchase

*Action Hash*
- belongs_to_active_hash :level

## Purchases テーブル (購入管理機能)
| column            | Type      | Options                      |
| ----------------- | --------- | ---------------------------- |
| price             | integer   | null: false                  |
| customer          | references| null: false,foreign_key: true|
| admin             | references| null: false,foreign_key: true|

- belongs_to :admin
- belongs_to :customer
- has_many :setting