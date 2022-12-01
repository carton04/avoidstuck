# テーブル設計

## usersテーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| nickname           | string | null: false                   |
| email              | string | null: false, unique_key: true |
| encrypted_password | string | null: false                   |

### Association
- has_many : congestions
- has_many : comments

## congestionsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| ski_resort_id | integer    | null: false                    |
| situation     | text       |                                |
| waiting       | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to : user
- has_many : comments

## commentsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| content    | text       | null: false                    |
| congestion | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :congestion