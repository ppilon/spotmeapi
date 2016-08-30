source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'active_model_serializers'

gem 'mongoid', '~> 5.0.0'

gem 'mongo'

gem 'devise'

group :test do
  gem "rspec-rails", "~> 2.14"
  gem "factory_girl_rails"
  gem 'ffaker'
  gem "shoulda-matchers"
end

group :development do
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano3-unicorn'
end

group :production do
  gem 'unicorn'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # # Access an IRB console on exception pages or by using <%= console %> in views
  # gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

