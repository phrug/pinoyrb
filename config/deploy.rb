require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'  
# require 'mina/rvm'    # for rvm support. (http://rvm.io)

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :domain, 'phrug.bryanbibat.net'
set :deploy_to, '/home/ruby2/phrug'
set :repository, 'git://github.com/phrug/pinoyrb.git'
set :user, 'ruby2'
set :branch, 'master'

# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_paths, ['config/database.yml', 'log', 'tmp/puma', 'config/initializers/secret_token.rb', 'config/initializers/asset_sync.rb']

# Optional settings:
#   set :user, 'foobar'    # Username in the server to SSH to.
#   set :port, '30000'     # SSH port number.

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .rbenv-version to your repository.
  invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  # invoke :'rvm:use[ruby-1.9.3-p125@default]'
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

  queue! %[mkdir -p "#{deploy_to}/shared/config/initializers"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config/initializers"]

  queue! %[mkdir -p "#{deploy_to}/shared/tmp/puma"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp/puma"]

  queue! %[touch "#{deploy_to}/shared/config/database.yml"]
  queue! %[touch "#{deploy_to}/shared/config/initializers/secret_token.rb"]
  queue! %[touch "#{deploy_to}/shared/config/initializers/asset_sync.rb"]
end

namespace :puma do
  desc "Starts Puma."
  task :start do
    queue "cd #{deploy_to!}/#{current_path!} && rm tmp/puma/socket.sock && bundle exec puma -C config/puma.rb"
  end

  desc "Restarts Puma."
  task :restart do
    pid_file = "#{deploy_to!}/#{current_path!}/tmp/puma/pid"
    log 'Restarting Puma'
    queue %{
      if [ -e #{pid_file} ] && kill -0 `cat #{pid_file}` > /dev/null 2>&1; then 
         kill -s USR2 `cat #{pid_file}`
      fi
    }
  end
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    to :launch do
      invoke :'puma:restart'
    end
  end
end

# For help in making your deploy script, see the Mina documentation:
#
#  - http://nadarei.co/mina
#  - http://nadarei.co/mina/tasks
#  - http://nadarei.co/mina/settings
#  - http://nadarei.co/mina/helpers

