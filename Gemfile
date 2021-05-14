source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 2.6.0'

gem 'rails', '6.0.3.6'
gem 'pg'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'redis', '~> 4.0'
gem 'redis-actionpack'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'sorcery'
gem 'lograge'
gem 'rambulance'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :test do
  gem 'simplecov', require: false
  gem 'simplecov-cobertura', require: false
  gem 'minitest-reporters', require: false
end
