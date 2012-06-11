set :rvm_type, :user
$:.unshift(File.expand_path('.lib', ENV['rvm_path']))
require 'rvm/capistrano'

set :application, "ss_editor"
set :repository, "git://github.com/np-complete/ss_editor.git"
set :deploy_to, "/home/masaki/www/#{application}"

set :scm, :git
role :web, "hisme.net"
role :app, "hisme.net"
role :db,  "hisme.net", :primary => true

require 'capistrano-unicorn'

namespace :bundler do
  task :create_symlink, :roles => :app do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(current_release, '.bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
  end

  task :bundle_new_release, :roles => :app do
    bundler.create_symlink
    run "cd #{release_path} && bundle install --without test"
  end
end

after 'deploy:update_code', 'bundler:bundle_new_release'
