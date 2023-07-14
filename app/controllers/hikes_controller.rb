class HikesController < ApplicationController
  set :default_content_type, 'application/json'

  # HIKES INDEX ROUTE:
  get "/hikes" do
      Hike.all.to_json
  end

  # added from e as a new operation completley
  get "/states/:state_id/hikes" do
    find_state
    @state.hikes.to_json(include: [:state])
  end

  # HIKES SHOW ROUTE:
  get "/hikes/:id" do
    begin
      Hike.find(params["id"]).to_json(include: :states)
    rescue ActiveRecord::RecordNotFound => e
      {errors: e}.to_json
     end
  end


  post "/states/:id/hikes" do
    find_state
    @hike = @state.hikes.build(params)
    if @hike.save
      hike_to_json
    else
      hike_error_messages
    end
  end

  
  # patch "/hikes/:id" do
  #   hike = Hike.find_by_id(params["id"])
  #   if hike && hike.update(params)
  #     hike.to_json(include: :states)
  #   elsif !hike
  #     {errors: "Record not found with id provided"}.to_json
  #   else
  #     hike.errors.full_messages.to_sentence
  #   end
  # end

  # added from e to replace above
  patch "/hikes/:id" do
    find_hike
    if @hike.update(params)
      hike_to_json
    else
      hike_error_messages
    end
  end


  # delete "/hikes/:id" do
  #   hike = Hike.find_by_id(params["id"])
  #   if hike&.destroy
  #     {errors: "Record successfully destroyed"}.to_json
  #   else
  #     {errors: "Record not found with id"}.to_json
  #   end
  # end
# added from e to replace above
  delete "/hikes/:id" do
    find_hike
    if @hike
      @hike.destroy
      @hike.to_json
    else
      { errors: ["Hike Doesn't Exist"] }.to_json
    end
  end

  # added additionaly from E
  private
    def find_hike
      @hike = Hike.find_by_id(params["id"])
    end

    def find_state
      @state = State.find_by_id(params["state_id"])
    end

    def hike_to_json
      @hike.to_json(include: [:state])
    end

    def hike_error_messages
      { errors: @hike.errors.full_messages }.to_json
    end

end
