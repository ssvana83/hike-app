require "pry"
class StatesController < ApplicationController
  set :default_contect_type, 'application/json'

  # GET: /states
  get "/states" do
    State.all.to_json(include: [hikes: {except: [:created_at, :updated_at]}], 
      except: [:created_at, :updated_at])
  end

  # POST: /states
  post "/states" do
    state = State.create(params)
    if state.id
      state.to_json(include: :hikes)
    else
      state.errors.full_messages.to_sentence
    end
  end

  # GET: /states/5
  get "/states/:id" do
    begin
      State.find(params["id"]).to_json(include: :hikes)
    rescue ActiveRecord::RecordNotFound => e
      {errors: e}.to_json
     end
  end

  # PATCH: /states/5
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

  # DELETE: /states/5/delete
  delete "/states/:id" do
    state = State.find_by_id(params["id"])
    if state&.destroy
      {errors: "Record successfully destroyed"}.to_json
    else
      {errors: "Record not found with id"}.to_json
    end
  end

  

end
