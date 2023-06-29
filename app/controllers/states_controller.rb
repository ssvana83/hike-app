require "pry"
class StatesController < ApplicationController
  set :default_contect_type, 'application/json'


  get "/states" do
    State.all.to_json(include: [hikes: {except: [:created_at, :updated_at]}], 
      except: [:created_at, :updated_at])
  end

  get "/states/:id" do
    begin
      State.find(params["id"]).to_json(include: :hikes)
    rescue ActiveRecord::RecordNotFound => e
      {errors: e}.to_json
     end
  end

  post "/states" do
    state = State.create(params)
    if state.id
      state.to_json(include: :hikes)
    else
      state.errors.full_messages.to_sentence
    end
  end

  patch "/states/:id" do
    state = State.find_by_id(params["id"])
    if state && state.update(params)
      state.to_json(include: :hikes)
    elsif !state
      {errors: "Record not founf with id provided"}.to_json
    else
      state.errors.full_messages.to_sentence
    end
  end

  delete "/states/:id" do
    state = State.find_by_id(params["id"])
    if state&.destroy
      {errors: "Record successfully destroyed"}.to_json
    else
      {errors: "Record not found with id"}.to_json
    end
  end

end
