# アプリケーション名
AVOIDSTUCK

# アプリケーション概要
ユーザーのスタック情報投稿により他のユーザーがそれを回避できる。

# URL
http://18.182.213.189/

# テスト用アカウント
- Basic認証パスワード：admin  
- Basic認証ID：2222  
- メールアドレス：test@test.com
- パスワード：aaa111

# 利用方法
## スタック投稿
1. トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う  
2. NewStuckボタンから情報の内容（現在地情報・スキー場・状況・待ち時間・画像）を入力し投稿する
## 情報閲覧
1.一覧ページから情報をクリックし詳細を確認する

# アプリケーションを作成した背景
自身の経験からスキー場への道中でのスタックに悩まされていた。
同様の問題を抱えている方も多いと推測し、投稿から回避できるアプリケーションを開発することにした。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1AE68r5MZd7iHtCUW1pAJUkY0x89ThRmQc9UWF_AFv6Y/edit#gid=1785908763

# 実装予定の機能
解決ボタン機能
お気に入り機能
いいね機能
コメント機能
フォロー機能
# データベース設計

# 画面遷移図

# 開発環境
- Ruby
- Ruby on Rails
- 
- Github
- AWS
- Visual Studio Code

# ローカルでの動作方法
以下のコマンドを順に実行。
% git clone
% cd avoidstuck
% bundle install
% yarn install

# 工夫したポイント
