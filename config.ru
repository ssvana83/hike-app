# fundamental file that starts eveything.
# rackup: middle layer to help setup applications

# this gives access to everything in application;
# good practice is "require_relative" for files, "require" for gems 
require_relative './config/environment'

# if ActiveRecord::Base.connection.migration_context.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :delete, :put, :patch, :options, :head]
  end
end

# use RACK::JSONBodyParser
# What starts everything. Intro coponant/controller/class that satrts the whole logic
# only controller has the run, all children will use keyword "use"
use HikesController
use StatesController
run ApplicationController


