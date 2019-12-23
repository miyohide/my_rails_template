source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 5.2.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

gem "lograge"

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "pry-rails"
  gem "rubocop", require: false
  gem "rspec-rails"
  gem "rspec_junit_formatter"
  gem "factory_bot_rails"
  gem "rails-controller-testing"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "brakeman"
  gem "bullet"
  gem "license_finder"
  gem "bundler-audit"
  gem "rubocop-rails"
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem "simplecov", require: false
  gem "simplecov-cobertura", require: false
end

gem 'sorcery'
gem "webpacker", '~> 4.x'
gem "redis"
