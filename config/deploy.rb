require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'
require 'mina/rbenv/addons'
require 'mina_sidekiq/tasks'
require 'mina/unicorn'
require 'mina/puma'

set :domain, '78.8.191.166'
set :deploy_to, '/home/jsbarm/jesusbook/'
set :repository, 'https://github.com/danielld75/jesusbook.git'
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
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do
  command %[mkdir -p "#{fetch(:deploy_to)}/shared/log"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/log"]

  command %[mkdir -p "#{fetch(:deploy_to)}/shared/config"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/config"]

  command %[touch "#{fetch(:deploy_to)}/shared/config/database.yml"]
  comment  %[echo "-----> Be sure to edit 'shared/config/database.yml'."]

  command %[touch "#{fetch(:deploy_to)}/shared/config/secrets.yml"]
  comment %[echo "-----> Be sure to edit 'shared/config/secrets.yml'."]

  # sidekiq needs a place to store its pid file and log file
  command %[mkdir -p "#{fetch(:deploy_to)}/shared/pids/"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/pids"]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do

    invoke :'sidekiq:quiet'
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      in_path(fetch(:current_path)) do
        invoke :'sidekiq:restart'
        invoke :'unicorn:restart'
        invoke :'puma:phased_restart'
        command %{mkdir -p tmp/}
        command %{touch #{fetch(:deploy_to)}/tmp/restart.txt}
      end
    end
  end
end
