## usersテーブル

| Column                 | Type   | Options      |
| ---------------------- | ------ | ------------ |
| name                   | string | null: false  |
| email                  | string | unique: true |
| encrypted_password     | string | null: false  |
| style                  | string | null: false  |
| text                   | text   | null: false  |

### Association
- has_many :camps
- has_many :comments

## campsテーブル

| Column         | Type    | Options                       |
| -------------- | ------- | ----------------------------- |
| title          | string  | null: false                   |
| text           | text    | null: false                   |
| category       | string  | null: false                   |
| user_id        | integer | null: false foreign_key: true |

### Association
- belongs_to :user
- has_many :comments

## commentsテーブル

| Column      | Type    | Options                       |
| ----------- | ------- | ----------------------------- |
| camp_id     | integer | null: false foreign_key: true |
| user_id     | integer | null: false foreign_key: true |
| text        | text    | null: false                   |

### Association
- belongs_to :user
- belongs_to :camp
