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
gem 'sequenced'

# Asset pipeline gems
gem 'sprockets', '4.0.0.beta4'
gem 'sassc-rails'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'autoprefixer-rails'
gem 'babel-transpiler'
gem 'turbolinks', '~> 5.x'
gem 'semantic-ui-sass'
gem 'font-awesome-sass', git: 'https://github.com/joelmoss/font-awesome-sass.git',
                         branch: 'sassc-rails_support'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

group :development, :test do
  gem 'rubocop'
  gem 'rubocop-rspec'
  gem 'byebug'
  gem 'bundler-audit'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 3.5'
  gem 'mocha'
  gem 'eslint-rails'
end

group :development do
  gem 'web-console', '~> 3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'guard-rails', require: false
  gem 'guard-bundler', require: false
  gem 'guard-rspec', '~> 4.7.0', require: false
  gem 'guard-rubocop', require: false
  gem 'guard-eslint', require: false, git: 'https://github.com/tadiou/guard-eslint.git'

  gem 'rack-mini-profiler'
  gem 'letter_opener'
end

group :test do
  gem 'database_cleaner'
  gem 'rails-controller-testing'
end
