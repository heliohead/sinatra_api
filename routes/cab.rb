module Api
  class App < Sinatra::Base
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

      if cab = Cab.find_by_id(params[:id].to_i)
        cab.to_json
      else
        json_status 404, "Not found"
      end
    end

    post "/cab/new/?", :provides => :json do
      content_type :json

      new_params = accept_params(params, :name, :email, :password, :address)

      cab = Cab.new(new_params)
      if cab.save
        headers["Location"] = "/cab/#{cab.id}"
        status 201
        cab.to_json
      else
        json_status 400, cab.errors.full_messages
      end
    end

    patch "/cab/:id/edit", :provides => :json do
      content_type :json

      new_params = accept_params(params, :name, :password, :address, :up_votes, :down_votes)

      if cab = Cab.find_by_id(params[:id].to_i)
        cab.update(new_params)
        if cab.save
          status 200
          cab.to_json
        else
          json_status 400, cab.errors.to_hash
        end
      else
        json_status 404, "Not found"
      end
    end

    delete "/cab/:id/?", :provides => :json do
      content_type :json

      if cab = Cab.find_by_id(params[:id].to_i)
        cab.destroy!
        status 204
      else
        json_status 404, "Not found"
      end
    end
  end
end