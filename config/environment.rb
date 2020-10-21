require "bundler/setup"
Bundler.require
require "sinatra/activerecord"
require "ostruct"
require "date"
require "tty-prompt"
require "rest-client"
require "tty-box"
require "tty-screen"

require_all 'app/models'

ENV["SINATRA_ENV"] ||= 'development'
ActiveRecord::Base.establish_connection(ENV["SINATRA_ENV"].to_sym)

Menu.start_menu
Menu.user_menu