require 'bundler/capistrano'
require 'rvm/capistrano'

set :application, "ss_editor"
set :domain, 'hisme.net'
set :user, "masaki"
set :use_sudo, false
set :repository, "git://github.com/np-complete/ss_editor.git"
set :deploy_to, "/home/masaki/www/#{application}"

set :rvm_type, :user
set :rvm_ruby_string, "2.0.0@ss_editor"

set :scm, :git

role :web, domain
role :app, domain
role :db,  domain, :primary => true

require 'capistrano-unicorn'
after 'deploy:restart', 'unicorn:restart'
