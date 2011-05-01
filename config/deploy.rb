set :application, "ss_editor"
set :repository, "git://github.com/np-complete/ss_editor.git"
set :deploy_to, "/usr/local/www/#{application}"

set :scm, :git
role :web, "hisme.net"
role :app, "hisme.net"
role :db,  "hisme.net", :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
