# FURIMA

## 概要

フリーマーケットのアプリケーションを作成しました。  
ユーザーを登録することで商品を出品できるようになります。  
自身が出品した商品の編集と削除をすることができます。（売却済みの商品を除く）  
他者が出品した商品は、クレジットカードを用いて購入することができます。（売却済みの商品を除く）  

## 使用言語

- HTML,CSS
- Ruby 2.6.5
- JavaScript

## テスト

- RSpec
  - 単体テスト(model)

## URL(停止中）

https://furima-38380.onrender.com

## 挙動確認

### Basic認証
  - ID：tc131tsb
  - Pass： 38380
### テスト用アカウント等
  - 出品者用
    - メールアドレス名：test@mail
    - パスワード：testuser11
  - 購入者用
    - メールアドレス：test2@mail
    - パスワード：testuser22
    - 購入用カード情報
      - 番号：4242424242424242
      - 期限：登録時より未来
      - セキュリティコード：123

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| info                   | text       | null: false                    |
| category_id            | integer    | null: false                    |
| sales_status_id        | integer    | null: false                    |
| shipping_fee_status_id | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| scheduled_delivery_id  | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :sales_status
- belongs_to_active_hash :shipping_fee_status
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :scheduled_delivery

## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :destination

## destinations テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| purchase      | references | null: false, foreign_key: true |
| postcode      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phone_number  | integer    | null: false                    |

### Association

- belongs_to :purchase
- belongs_to_active_hash :prefecture
