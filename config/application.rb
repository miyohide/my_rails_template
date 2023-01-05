require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsForAzureWebapps
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # semantic_loggerの設定
    # ファイル出力はしない
    config.rails_semantic_logger.add_file_appender = false
    # 標準出力だけして、JSON形式で出力する
    config.semantic_logger.add_appender(io: $stdout, level: config.log_level, formatter: :json)
  end
end
