# fundamental file that starts eveything.
# rackup: middle layer to help setup applications

# this gives access to everything in application;
# good practice is "require_relative" for files, "require" for gems 
require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# What starts everything. Intro coponant/controller/class that satrts the whole logic
# only controller has the run, all children will use keyword "use"

use StatesController
run ApplicationController
use HikesController

