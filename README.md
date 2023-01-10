# README

Railsを使ったテンプレートプロジェクトです

# 起動の方法

`bin/dev`で起動する。

# Bootstrapの導入方法

Bootstrapの導入方法については、[Rails7時代のJS/CSSバンドルの新常識](https://hazm.jp/archives/147)を参考に、[cssbundling-rails](https://github.com/rails/cssbundling-rails)を使って導入した。

# RailsのHTMLタグにおけるclassの指定方法

RailsのHTMLタグにおけるclassの指定方法については、[RailsのFormBuilderのAPI](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html)を確認すること。

# エラーが発生したフォームに付与するHTMLタグのカスタマイズ

[Railsアプリケーションを設定する（Railsガイド）](https://railsguides.jp/configuring.html#config-action-view-field-error-proc)

# LogのJSON化

最初は[Lograge](https://github.com/roidrage/lograge)でも使えばいいかなと思っていたんだけれども、Rails 7への対応が明記されていないので、[Semantic Logger](https://logger.rocketjob.io/rails)を使ってみることにした。

# Railsのバリデーション

基本は[RailsガイドのActive Recordバリデーション](https://railsguides.jp/active_record_validations.html)を参照。

# Prettierの導入

ICS Mediaの以下の記事を参考にした。

- [Prettierの導入方法 フロントエンド開発で必須のコード整形ツール](https://ics.media/entry/17030/)

