# これは何か

Rails 6.0のサンプルアプリです。Azure Web Apps上で動かすことを念頭に置いています。

# 手元での動かし方

## 1. Gemのインストール

以下のコマンドを実行してGemをインストールします。

```bash
$ docker-compose run --rm web bundle install
```

## 2. データベースの作成

PostgreSQLのデータベースを作成します。

```bash
$ docker-compose run --rm web bin/rails db:create
```

## 3. テーブルなどの作成

`db:migrate`を実行してテーブルなどを作成します。

```bash
$ docker-compose run --rm web bin/rails db:migrate
```

## 4. 起動

アプリケーションを起動します。起動後は`localhost:3000`にアクセスします。

```bash
$ docker-compose up
```

## 5. 終了方法

別のターミナルで以下のコマンドを実行します。

```bash
$ docker-compose down
```

# Gemの追加

Gemを追加したいときは、`Gemfile`に追加したいGemを記入したあと以下のコマンドを実行する。

```
docker-compose run --rm web bundle install
```

# 起動後アプリにアクセスすると`Sprockets::FileNotFound`がでる

一旦`rm -rf bin/webpack*`を実行後、`docker-compose run --rm web rails webpacker:install`を実行する

# Azure Web Appsに載せる

## 設定

Azure Web Appsを作成する段階で、Dockerイメージを選択すればOK。

イメージの更新はアプリの再起動でできる。

## Blocked hostが発生する

`config/application.rb`に以下の設定を追加。

```ruby
config.hosts << '.azurewebsites.net'
```
