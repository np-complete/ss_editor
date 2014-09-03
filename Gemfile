source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '3.2.13'
gem 'rake'
gem 'parent_resource'
gem 'rack-openid'
gem 'ruby-openid-apps-discovery'
gem 'dynamic_form'
gem 'gravatar_image_tag'
gem 'paperclip'
gem 'jquery-rails'
gem 'unicorn'
gem 'haml'
gem 'haml-rails'
gem 'simple_form'

gem 'devise'
gem 'omniauth-openid'

group :assets do
  gem 'coffee-rails'
  gem 'sass-rails'
  gem 'uglifier'
  gem 'twitter-bootstrap-rails'
  gem 'therubyracer'
  gem 'less-rails'
end

group :test, :development do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'rspec', '< 3'
  gem "rspec-rails"
  gem "auto_mock"
  gem "webrat"
  gem "guard"
  gem "guard-rspec"
  gem "guard-spork"
  gem "guard-bundler"
  gem "pry"
  gem "pry-doc"
  gem "factory_girl_rails"

  gem "rb-inotify", :require => false
  gem "rb-fsevent", :require => false
  gem "rb-fchange", :require => false

  gem "growl", :require => false
  gem "libnotify", :require => false
end

group :production do
  gem 'mysql2'
  gem 'rails_12factor'
end

group :development do
  gem 'capistrano'
  gem 'capistrano_colors'
  gem 'capistrano-unicorn'
  gem 'rvm-capistrano'
end
