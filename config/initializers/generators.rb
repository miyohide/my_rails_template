# rails generateコマンドで生成するファイルを指定
Rails.application.config.generators do |g|
  g.helper false  # helperファイルは作らない
end
