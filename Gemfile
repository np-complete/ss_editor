
source 'http://rubygems.org'

gem 'rails', '3.1.0'

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
  gem "autotest"
  gem "cover_me"
end

group :production do
  gem 'mysql2', '< 0.4.0'
end

group :development do
  gem 'capistrano'
  gem 'capistrano_colors'
  gem 'capistrano-unicorn'
end
