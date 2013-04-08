# config/deploy.rb
# $:.unshift(File.expand_path('./lib', ENV['rvm_path'])) #
# require 'rvm/capistrano'  # Add RVM integration
require 'bundler/capistrano'  # Add Bundler integration
# load 'deploy/assets'  
# only for rails 3.1 apps, this makes sure our assets are precompiled.

set :application, "simple_cms"
role :web, "54.228.151.235"  # Your HTTP server, Apache/etc
role :app, "54.228.151.235"  # This may be the same as your `Web` server
role :db,  "54.228.151.235", :primary => true  # This is where Rails migrations will run

set :scm, :git
set :repository, "git@github.com:pasilindholm/cmstest.git"
set :branch, "master"

default_run_options[:pty] = true
# Agent Forwarding
ssh_options[:forward_agent] = true

set :user, "deploy"
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false