## 📘 テーブル定義（README）

### Users テーブル（Devise使用）

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| name               | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| company_id         | references | null: false, foreign_key: true |

#### Association
- belongs_to :company  
- has_many :knowhows  
- has_many :quizzes  
- has_many :notes  


###  Companies テーブル

| Column | Type   | Options                         |
|--------|--------|---------------------------------|
| name   | string | null: false, unique: true       |

#### Association
- has_many :users  
- has_many :knowhows, through: :users  
- has_many :quizzes, through: :users  


###  Knowhows テーブル（ノウハウ投稿）

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| title      | string     | null: false                    |
| body       | text       | null: false                    |
| user_id    | references | null: false, foreign_key: true |

#### Association
- belongs_to :user  
- has_many :notes  
- has_one_attached :audio  
- has_many_attached :media_files  


###  Quizzes テーブル（クイズ）

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| question   | text       | null: false                    |
| answer     | text       | null: false                    |
| user_id    | references | null: false, foreign_key: true |

#### Association
- belongs_to :user  


###  Notes テーブル（メモ）

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| content    | text       | null: false                    |
| user_id    | references | null: false, foreign_key: true |
| knowhow_id | references | null: false, foreign_key: true |

#### Association
- belongs_to :user  
- belongs_to :knowhow  


## 🔐 アクセス制限ポリシー

- 各ユーザーは `company_id` を持ち、**同じ会社の投稿・クイズ・メモのみ閲覧可**
- `current_user.company_id == resource.company_id` を条件に制御
- 管理者権限（`role`）は将来的に導入予定