# set path to application
app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"
working_directory "/home/deployer/apps/spotmeapi/current"


# Set unicorn options
worker_processes 2
preload_app true
timeout 30

# Set up socket location
listen "/home/deployer/apps/spotmeapi/shared/tmp/sockets/unicorn.sock", :backlog => 64

# Logging
stderr_path "/home/deployer/apps/spotmeapi/shared/log/unicorn.stderr.log"
stdout_path "/home/deployer/apps/spotmeapi/shared/log/unicorn.stdout.log"

# Set master PID location
pid "/home/deployer/apps/spotmeapi/shared/tmp/pids/unicorn.pid"