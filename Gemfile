# the package.json
# where all gems are listed

source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord', '~> 5.2'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem 'faker'
gem 'tux'

# dependencies for production to make bundler smaller 
group :development do
  gem 'sqlite3'
  gem 'tux'
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
end
