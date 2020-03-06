# これは何か

Rails 6.0のサンプルアプリです。Azure Web Apps上で
動かすことを念頭に置いています。

# 作り方

最初に`Dockerfile`、`Gemfile`、`Gemfile.lock`、`entrypoint.sh`、`docker-compose.yml`を作成します。
それぞれの内容は https://github.com/miyohide/rails_for_azure_webapps/tree/d2e0d6bb409a77d6a3f6165d904ef2fb7b100014 の内容をみると良いかと思います。

その後、`rails new`を実行します。

`rails new`コマンドは以下のオプションを指定します。

```
> docker-compose run --rm web rails new . --force --no-deps -T -G --skip-turbolinks
```

ポイントは、`-G`オプションを指定しているところです。Gitリポジトリとして構築しているところでさらに`rails new`の処理中に`git init`を実行されると`rails new`が途中で終了してしますので`-G`をつけています。
