# fundamental file that starts eveything.
# rackup: middle layer to help setup applications

# this gives access to everything in application;
require_relative './config/environment'

# Allow CORS (Cross-Origin Resource Sharing) requests;
use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :delete, :put, :patch, :options, :head]
  end
end

# Parse JSON from the request body into the params hash;
use Rack::JSONBodyParser

# Intro componant/controller/class that starts the whole logic
# controller (run) all children (use);
use HikesController
use StatesController
run ApplicationController


