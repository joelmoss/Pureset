source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '>= 5.0.0.beta3', '< 5.1'
gem 'pg', '~> 0.18'
gem 'puma'
gem 'redis', '~> 3.0'
gem 'devise', '4.0.0.rc2'
gem 'simple_form'
gem 'github-markup', require: 'github/markup'
gem 'redcarpet'

# Asset pipeline gems
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'font-awesome-sass'
gem 'autoprefixer-rails'
gem 'babel-transpiler'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

group :development, :test do
  gem 'rubocop', '~> 0.39.0'
  gem 'rubocop-rspec'
  gem 'byebug'
  gem 'bundler-audit'
  gem 'factory_girl_rails'
  gem 'faker'

  # we need to be explicit about loading the rspec beta gems, otherwise guard-rspec will fail.
  # See https://github.com/guard/guard-rspec/issues/360
  gem 'rspec', '3.5.0.beta3'
  gem 'rspec-core', '3.5.0.beta3'
  gem 'rspec-rails', '3.5.0.beta3'
end

group :development do
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard-rails', require: false
  gem 'guard-livereload', require: false
  gem 'guard-bundler', require: false
  gem 'guard-rspec', '~> 4.6.5', require: false
  gem 'guard-rubocop', require: false
  gem 'guard-scss_lint', require: false
  gem 'letter_opener'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'database_cleaner'
  gem 'rails-controller-testing'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
