module Api
  class App < Sinatra::Base
    get "/ride/?", :provides => :json do
      content_type :json

      if ride = Ride.all
        status 200
        ride.to_json
      else
        json_status 404, "Not found"
      end
    end

    get "/ride/:id", :provides => :json do
      content_type :json

      if ride = Ride.find_by_id(params[:id].to_i)
        ride.to_json
      else
        json_status 404, "Not found"
      end
    end

    post "/ride/?", :provides => :json do
      content_type :json

      new_params = accept_params(params, :passengers_id, :cabs_id, :starts_at, :ends_at)

      ride = Ride.new(new_params)
      if ride.save
        headers["Location"] = "/ride/#{ride.id}"
        status 201
        ride.to_json
      else
        json_status 400, ride.errors.full_messages
      end
    end

    patch "/ride/:id/edit", :provides => :json do
      content_type :json

      new_params = accept_params(params, :starts_at, :ends_at)

      if ride = Ride.find_by_id(params[:id].to_i)
        ride.update(new_params)
        if ride.save
          status 200
          ride.to_json
        else
          json_status 400, ride.errors.to_hash
        end
      else
        json_status 404, "Not found"
      end
    end

    delete "/ride/:id/?", :provides => :json do
      content_type :json
near
      if ride = Ride.find_by_id(params[:id].to_i)
        ride.destroy!
        status 204
      else
        json_status 404, "Not found"
      end
    end

    get "/ride/cabs_near/?", :provides => :json do
      content_type :json

      if cabs_near = Cab.near(params[:address])
        cabs_near.to_json
      else
        json_status 404, "Not found"
      end
    end
  end
end