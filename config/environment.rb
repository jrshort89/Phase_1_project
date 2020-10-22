require "bundler/setup"
Bundler.require

require_all 'app/models'
require_all 'ascii'

ENV["SINATRA_ENV"] ||= 'development'
ActiveRecord::Base.establish_connection(ENV["SINATRA_ENV"].to_sym)

old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil