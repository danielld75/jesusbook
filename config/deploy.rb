require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'
# require 'mina/rbenv/addons'
require 'mina_sidekiq/tasks'
require 'mina/unicorn'
# require 'mina/whenever'
# require 'mina/puma'

set :domain, '78.8.191.166'
set :deploy_to, '/home/jsbarm/jesusbook/'
set :repository, 'https://github.com/danielld75/jesusbook.git'
set :branch, 'master'
set :user, 'jsbarm'
set :forward_agent, true
set :port, '6969'
set :rbenv_path, "$HOME/.rbenv"
set :unicorn_pid, "#{fetch(:deploy_to)}/shared/pids/unicorn.pid"
set :linked_dirs, fetch(:linked_dirs, []).push('public/system')
set :sidekiq, -> { "#{fetch(:bundle_bin)} exec sidekiq" }
set :sidekiqctl, -> { "#{fetch(:bundle_prefix)} sidekiqctl" }


# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_paths, ['config/database.yml', 'log', 'config/secrets.yml']

set :shared_paths, ['config/database.yml', 'log']
set :keep_releases, 2

task :environment do
  invoke :'rbenv:load'
end
#
# desc "Deploys."
task :deploy do
  run :local do
    puts 'buja'
  end

  deploy do
    invoke :'git:clone'
    invoke :'sidekiq:quiet'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      comment %{in launch}
    end
  end
end

desc 'Task description'
task :test do
  run :remote do
    comment %{PWD}
    in_path('/Users') do
      command %{ls -al}
    end
    on :after do
      command %{pwd}
    end
  end

  run :local do
    command %{ls -al}
  end
end

desc 'Fails test'
task :fail do
  run :remote do
    run :local do
      command "pwd"
    end
  end
end

task :local_environment do
  comment 'local environment run'
  command 'export HERE=local'
end

task :remote_environment do
  comment 'remote environment run'
  command 'export HERE=remote'
end

task test_envs: :environment do
  run(:local) do
    command 'echo $HERE'
  end

  run(:remote) do
    command 'echo $HERE'
  end

  run(:local) do
    command 'echo $HERE'
  end

  run(:remote) do
    command 'echo $HERE'
  end
end