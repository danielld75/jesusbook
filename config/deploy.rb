require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'
# require 'mina/rbenv/addons'
require 'mina_sidekiq/tasks'
require 'mina/unicorn'
# require 'mina/puma'

set :domain, '78.8.191.166'
# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :application, "jesusbook.info"
set :repo_url, "https://github.com/danielld75/jesusbook.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"
set :deploy_to, '/home/jsbarm/jesusbook/'
set :branch, 'master'
set :user, 'jsbarm'
set :forward_agent, true
set :port, '6969'
set :unicorn_pid, "#{fetch(:deploy_to)}/shared/pids/unicorn.pid"
set :linked_dirs, fetch(:linked_dirs, []).push('public/system')
set :sidekiq, -> { "#{fetch(:bundle_bin)} exec sidekiq" }
set :sidekiqctl, -> { "#{fetch(:bundle_prefix)} sidekiqctl" }


# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_paths, ['config/database.yml', 'log', 'config/secrets.yml']


# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  command %{
    echo "-----> Loading environment"
    #{echo_cmd %[source ~/.bashrc]}
          }
  invoke :'rbenv:load'
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .rbenv-version to your repository.

set :use_sudo, false
set :bundle_binstubs, nil
set :linked_files, fetch(:linked_files, []).push('config/database.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

after 'deploy:publishing', 'deploy:restart'

namespace :deploy do
  task :restart do
    invoke 'unicorn:reload'
  end
end

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do

    invoke :'sidekiq:quiet'
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    # invoke :'deploy:cleanup'

    on :launch do
      in_path(fetch(:current_path)) do
        invoke :'sidekiq:restart'
        invoke :'unicorn:restart'
        # invoke :'puma:phased_restart'
        command %{mkdir -p tmp/}
        command %{touch #{fetch(:deploy_to)}/tmp/restart.txt}
      end
    end
  end
end

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
