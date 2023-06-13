require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    # set :views, 'app/views'  dont need this since we are using this just as API, not frontend
    set :default_content_type, :json
  end

  

end
