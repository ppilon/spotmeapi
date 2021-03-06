set :port, 22
set :user, 'deployer'
set :deploy_via, :remote_cache
set :use_sudo, false

server "192.168.1.52",
  roles: [:web, :app, :db],
  port: fetch(:port),
  user: fetch(:user),
  primary: true

set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

set :ssh_options, {
  forward_agent: true,
  auth_methods: %w(publickey),
  user: 'deployer',
}

set :rails_env, :production