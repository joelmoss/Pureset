source 'https://rubygems.org'

ruby '2.3.1'

gem 'railties', '~> 5.0'
gem 'rails', '~> 5.0'
gem 'pg', '~> 0.18'
gem 'puma'
gem 'redis', '~> 3.0'
gem 'devise'
gem 'simple_form'
gem 'stringex'
gem 'strip_attributes'
gem 'github-markup', require: 'github/markup'
gem 'redcarpet'

# Asset pipeline gems
gem 'sprockets', '4.0.0.beta3'
gem 'sass-rails', git: 'https://github.com/rails/sass-rails.git', ref: 'dfbcc6a'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'autoprefixer-rails'
gem 'babel-transpiler'
gem 'turbolinks', '~> 5.x'
gem 'font-awesome-sass'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

group :development, :test do
  gem 'rubocop', '~> 0.42.0'
  gem 'rubocop-rspec'
  gem 'byebug'
  gem 'bundler-audit'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  gem 'web-console', '~> 3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'guard-rails', require: false
  gem 'guard-bundler', require: false
  gem 'guard-rspec', '~> 4.7.0', require: false
  gem 'guard-rubocop', require: false

  gem 'letter_opener'
end

group :test do
  gem 'database_cleaner'
  gem 'rails-controller-testing'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
