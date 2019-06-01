# これはなにか

Azure Web AppsにRailsアプリを動かすためのサンプルアプリです。
合わせてDockerの勉強も兼ねています。

# 作業内容

## プロジェクトの作成

具体的な作り方は以下に書いてある。

[Quickstart: Compose and Rails](https://docs.docker.com/compose/rails/)

- Dockerfile
- Gemfile （仮でRailsだけを記したもの）
- Gemfile.lock （仮。空ファイル）
- entrypoint.sh （/tmp/server.pidを削除するもの）
- docker-compose.yml

を用意して、

```
docker-compose run web rails new . --force --no-deps --database=postgresql
```

としてプロジェクトを作成した。

その後、

```
docker-compose build
```

でimageを作ったらまずはおしまい。

## アプリの起動

通常は

```
docker-compose up
```

Gemfileを更新した場合はimageを再作成する必要がある。

```
docker-compose up --build
```

## Railsコマンドの実行

```
docker-compose run web rails xxxxx
```

## アプリの停止

```
docker-compose down
```
