# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git
# Include tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#   https://github.com/capistrano/passenger
#
# require 'capistrano/rbenv'
# require 'capistrano/chruby'
# require 'capistrano/bundler'
# require 'capistrano/rails/assets'
# require 'capistrano/rails/migrations'
require 'capistrano/rvm'
require 'capistrano/passenger'
require 'capistrano/rails'
require 'capistrano/scm/git'

# require 'whenever/capistrano'
# require 'capistrano/sidekiq'
# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }

# Capfile
# require 'capistrano/sidekiq/monit' #to require monit tasks # Only for capistrano3
