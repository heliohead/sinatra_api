module Api
  class App < Sinatra::Base

    get "/passenger/?", :provides => :json do
      content_type :json

      if passenger = Passenger.all
        status 200
        passenger.to_json
      else
        json_status 404, "Not found"
      end
    end

    get "/passenger/:id", :provides => :json do
      content_type :json

      if passenger = Passenger.find_by_id(params[:id].to_i)
        passenger.to_json
      else
        json_status 404, "Not found"
      end
    end

    post "/passenger/new/?", :provides => :json do
      content_type :json

      new_params = accept_params(params, :name, :email, :password, :address)

      passenger = Passenger.new(new_params)
      if passenger.save
        headers["Location"] = "/passenger/#{passenger.id}"
        status 201
        passenger.to_json
      else
        json_status 400, passenger.errors.full_messages
      end
    end

    patch "/passenger/:id/edit", :provides => :json do
      content_type :json

      new_params = accept_params(params, :name, :password, :address, :up_votes, :down_votes)

      if passenger = Passenger.find_by_id(params[:id].to_i)
        passenger.update(new_params)
        if passenger.save
          status 200
          passenger.to_json
        else
          json_status 400, passenger.errors.to_hash
        end
      else
        json_status 404, "Not found"
      end
    end

    delete "/passenger/:id/?", :provides => :json do
      content_type :json

      if passenger = Passenger.find_by_id(params[:id].to_i)
        passenger.destroy!
        status 204
      else
        json_status 404, "Not found"
      end
    end
  end
end