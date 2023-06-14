# this is my task manager. The way for me to run things from terminal and communicate with 
# the application

require_relative './config/environment'
require 'sinatra/activerecord/rake'

# this ine creates a shortcut so that you can esier do delete/restarts of 
desc "Start the server"
task :server do  
  if ActiveRecord::Base.connection.migration_context.needs_migration?
    puts "Migrations are pending. Make sure to run `rake db:migrate` first."
    return
  end
end



def reload
    load_all "./app" if Dir.exists?("./app")
end

desc "rake console"
task :console do 
    puts "loading the environment..."
    reload
    puts "Starting the pry console..."
    Pry.start
end

desc "reset db"
task :reset_db do
    puts "Dropping the database"
    system "rm ./db/development.sqlite"
    system "rm ./db/test.sqlite"
    system "rm ./db/production.sqlite"
    system "rm ./db/schema.sqlite"
    puts "Running migrations"
    system "rake db:migrate"
    puts "seeding the database"
    system "rake db:seed"
    puts "Done seeding!"
end