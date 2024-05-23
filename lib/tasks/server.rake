# lib/tasks/server.rake

namespace :server do
    desc "Restart the Rails server if it's already running, start it if not"
    task :restart => :environment do
      pid_file = "#{Rails.root}/tmp/pids/server.pid"
  
      if File.exist?(pid_file)
        pid = File.read(pid_file).to_i
        begin
          Process.kill(0, pid)
          puts "Rails server is already running with PID #{pid}. Restarting..."
          `kill -SIGINT #{pid}`
        rescue Errno::ESRCH
          puts "Rails server is not running. Starting..."
          `rails server &`
        end
      else
        puts "Rails server is not running. Starting..."
        `rails server &`
      end
    end
  end
  