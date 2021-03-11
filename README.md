アプリケーション名 health

アプリケーション概要
筋トレや健康維持を支えるためのアプリケーション。
自分の理想の体に近づけるため、または体型維持のために1日のタンパク質量を計算しデータとして見る事ができる。

URL  https://health-3.herokuapp.com/

テスト用アカウント 
・Email/test@com
・Password/111111

利用方法
自分の理想の体や維持したい体型に向けコースを選択する。
それぞれに必要なタンパク質量を知り日々の食事のタンパク質量を調整する。
自分のでよく食べる食べ物をリスト化し管理しやすくする。

目指した課題解決
ユーザーの目指す体型をもとに「目標値」を設定し、目標値に向けた食事管理を手軽に行うことをめざしました。

・健康コース：軽運動をしていて体型を維持したい人
・マッチョコース:筋トレをしていて少し体つきをよくしたい人
・超マッチョコース:C:筋トレをしていて体を大きくしたい人


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

| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| course_name_id | float       | null: false                    |
| weight         | integer     | null: false                    |
| user_id        | references  | null: false, foreign_key: true |


- belongs_to :user


## foods テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| amount_of_protein | integer    | null: false                    |
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