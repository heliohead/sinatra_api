module Api
  class Routes < Sinatra::Base
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
      if Passenger.valid_id?(params[:id])
        if passenger = Passenger.first(:id => params[:id].to_i)
          passenger.to_json
        else
          json_status 404, "Not found"
        end
      else
        json_status 400, "Invalid data id must be an integer"
      end
    end

    post "/passenger/?", :provides => :json do
      content_type :json

      new_params = accept_params(params, :name, :email, :password, :latitude, :longitude)

      passenger = Passenger.new(new_params)
      if passenger.save
        headers["Location"] = "/passenger/#{passenger.id}"
        status 201
        passenger.to_json
      else
        json_status 400, passenger.errors.to_hash
      end
    end

    patch "/passenger/:id/edit", :provides => :json do
      content_type :json

      new_params = accept_params(params, :name, :email, :password, :latitude, :longitude)

      if Passenger.valid_id?(params[:id])
        if passenger = Passenger.first_or_create(:id => params[:id].to_i)
          passenger.attributes = passenger.attributes.merge(new_params)
          if passenger.save
            status 200
            passenger.to_json
          else
            json_status 400, passenger.errors.to_hash
          end
        else
          json_status 404, "Not found"
        end
      else
        json_status 400, "Invalid data id must be an integer"
      end
    end

    delete "/cab/:id/?", :provides => :json do
      content_type :json

      if cab = Cab.first(:id => params[:id].to_i)
        cab.destroy!
        status 204
      else
        json_status 404, "Not found"
      end
    end
  end
end