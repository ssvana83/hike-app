class HikesController < ApplicationController
  set :default_content_type, 'application/json'

  # GET: /hikes  
  get "/hikes" do
      Hike.all.to_json
  end

  # POST: /hikes 
  post "/hikes" do
    hike = Hike.create(params)
    binding.pry
    if hike.id
      hike.to_json(include: :states)
    else
      hike.errors.full_messages.to_sentence
    end
  end

  # GET: /hikes/5
  get "/hikes/:id" do
    begin
      Hike.find(params["id"]).to_json(include: :states)
    rescue ActiveRecord::RecordNotFound => e
      {errors: e}.to_json
     end
  end

  # PATCH: /hikes/5
  patch "/hikes/:id" do
    hike = Hike.find_by_id(params["id"])
    if hike && hike.update(params)
      hike.to_json(include: :states)
    elsif !hike
      {errors: "Record not found with id provided"}.to_json
    else
      hike.errors.full_messages.to_sentence
    end
  end

  # DELETE: /hikes/5/delete
  delete "/hikes/:id" do
    hike = Hike.find_by_id(params["id"])
    if hike&.destroy
      {errors: "Record successfully destroyed"}.to_json
    else
      {errors: "Record not found with id"}.to_json
    end
  end
end
