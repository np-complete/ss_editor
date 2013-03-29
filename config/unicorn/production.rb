RAILS_ROOT = '/home/masaki/www/ss_editor/current'
working_directory RAILS_ROOT

listen File.expand_path('tmp/pids/.sock', RAILS_ROOT)

stderr_path File.expand_path('log/unicorn.log', RAILS_ROOT)
stdout_path File.expand_path('log/unicorn.log', RAILS_ROOT)

preload_app true
pid File.expand_path('tmp/pids/unicorn.pid', RAILS_ROOT)

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  unless old_pid == server.pid
    begin
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
