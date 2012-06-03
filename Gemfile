
source 'http://rubygems.org'

gem 'rails'

gem 'parent_resource'
gem 'rack-openid'
gem 'ruby-openid-apps-discovery'
gem 'dynamic_form'
gem 'gravatar_image_tag'
gem 'paperclip'
gem 'prototype-rails'
gem 'unicorn'

group :test, :development do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem "rspec-rails"
  gem "auto_mock"
  gem "webrat"
  gem "guard"
  gem "guard-rspec"
  gem "guard-spork"
  gem "guard-bundler"
  gem "pry"
  gem "factory_girl_rails"
end

group :production do
  gem 'mysql2'
end

group :development do
  gem 'capistrano'
  gem 'capistrano_colors'
  gem 'capistrano-unicorn'
  gem 'rvm-capistrano'
end
