# アプリ名：Pet Diary（ペット日記）

ペット（ハムスター、猫、犬）の年齢を人間年齢に換算して確認でき、日々の思い出を写真付きで記録できるアプリです。

## テーブル設計

### users テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false, unique: true |
| password | string | null: false |

#### Association
- has_many :pets

### pets テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| birth_date  | date       | null: false                    |
| species_id  | integer    | null: false                    |
| gender_id   | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

#### Association
- belongs_to :user
- has_many :diaries

### diaries テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| pet     | references | null: false, foreign_key: true |

#### Association
- belongs_to :pet