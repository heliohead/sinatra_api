module Api
  class Routes < Sinatra::Base
    get "/cab/?", :provides => :json do
      content_type :json

      if cab = Cab.all
        status 200
        cab.to_json
      else
        json_status 404, "Not found"
      end
    end

    get "/cab/:id", :provides => :json do
      content_type :json
      if Cab.valid_id?(params[:id])
        if cab = Cab.first(:id => params[:id].to_i)
          cab.to_json
        else
          json_status 404, "Not found"
        end
      else
        json_status 400, "Invalid data id must be an integer"
      end
    end

    post "/cab/?", :provides => :json do
      content_type :json

      new_params = accept_params(params, :name, :email, :password, :latitude, :longitude)

      cab = Cab.new(new_params)
      if cab.save
        headers["Location"] = "/cab/#{cab.id}"
        status 201
        cab.to_json
      else
        json_status 400, cab.errors.to_hash
      end
    end

    patch "/cab/:id/edit", :provides => :json do
      content_type :json

      new_params = accept_params(params, :name, :email, :password, :latitude, :longitude)

      if Cab.valid_id?(params[:id])
        if cab = Cab.first_or_create(:id => params[:id].to_i)
          cab.attributes = cab.attributes.merge(new_params)
          if cab.save
            status 200
            cab.to_json
          else
            json_status 400, cab.errors.to_hash
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