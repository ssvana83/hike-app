class HikesController < ApplicationController

  # GET: /hikes
  get "/hikes" do
      Hike.all.to_json
  end

  # POST: /hikes
  post "/hikes" do
    
  end

  # GET: /hikes/5
  get "/hikes/:id" do
    
  end

  # PATCH: /hikes/5
  patch "/hikes/:id" do
    
  end

  # DELETE: /hikes/5/delete
  delete "/hikes/:id/delete" do
    
  end
end
