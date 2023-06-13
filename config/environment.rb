# says where we are
ENV['SINATRA_ENV'] ||= "development"

# in yur gemfile you have a ist of gems....this explains to require them ALL (not individually)
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

# this is how AtiveRecord sets up connection to database
# using sqlite management and explains where database lives
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

# require './app/controllers/application_controller'
# this is an absolute path to access everything directly from inside app 
require_all 'app'
