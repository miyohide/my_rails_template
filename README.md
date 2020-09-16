# これは何か

Rails 6.0のサンプルアプリです。Azure Web Apps上で動かすことを念頭に置いています。

# 手元での動かし方

## 1. .envファイルを作成する

`docker-compose.yml`内で指定している環境変数を`.env`ファイルから参照するようにしています（see. https://docs.docker.jp/compose/environment-variables.html#env ）。サンプルとして`sample.env`を用意していますので、これをコピーして使用してください。

## 1. Dockerイメージを作成する

以下のコマンドを実行してDockerイメージを作成します。

```bash
$ docker-compose build
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

# メンテナンス方法

## Gemの追加

`Gemfile`に追加したいGemを記入したあと以下のコマンドを実行します。

```
docker-compose run --rm web bundle install
```

## Gemの更新

以下のコマンドを実行します。

```
docker-compose run --rm web bundle update
```

## JavaScriptのライブラリの更新

以下のコマンドを実行します。

```
docker-compose run --rm web yarn upgrade
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
