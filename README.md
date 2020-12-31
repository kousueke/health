アプリケーション名 the-protein

アプリケーション概要
筋トレや健康維持を支えるためのアプリケーション。
自分の理想の体に近づけるため、または体型維持のために1日のタンパク質量を計算しデータとして見る事ができる。

URL  https://the-protein.herokuapp.com/

テスト用アカウント ログイン機能等を実装した場合は、記述しましょう。またBasic認証等を設けている場合は、そのID/Passも記述しましょう。

利用方法
自分の理想の体や維持したい体型に向けコースを選択する。
それぞれに必要なタンパク質量を知り日々の食事のタンパク質量を調整する。
自分のでよく食べる食べ物をリスト化し管理しやすくする。

目指した課題解決
A：軽運動をしていて体型を維持したい人、B:筋トレをしていて少し体つきをよくしたい人、C:C:筋トレをしていて体を大きくしたい人に向けて日々の食事管理を手軽にすることが出来るようにした。
また、視覚化をすることやLINEでの通知で継続するモチベーションを保つ。

洗い出した要件


# テーブル設計


## users テーブル

| Column             | Type         | Options     |
| ------------------ | ------------ | ----------- |
| email              | string       | null: false |
| encrypted_password | string       | null: false | 

### Association

- has_many :foods
- has_one :course_id



## course テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| body_weight   | string      | null: false                    |
| target_value  | string      | null: false                    |
| user_id       | references  | null: false, foreign_key: true |


- belongs_to :user


## foods テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| amount_of_protein | string     | null: false                    |
| number            | integer    | null: false                    |
| course_id         | references | null: false, foreign_key: true |
| user_id           | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :course
- belongs_to :day

### days テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| course_id     | references | null: false, foreign_key: true |
| foods_id      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :foods
- has_one :week
- has_one :month


### week テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| course_id     | references | null: false, foreign_key: true |
| days_id       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :days


### month テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| course_id     | references | null: false, foreign_key: true |
| days_id       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :days


実装した機能についてのGIFと説明

実装予定の機能
・lineとの紐付け

データベース設計  ER図
er.png


ローカルでの動作方法