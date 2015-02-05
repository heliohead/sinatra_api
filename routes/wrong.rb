module Api
  class App < Sinatra::Base
    def self.put_or_post(*a, &b)
      put *a, &b
      post *a, &b
    end

    get "*" do
      status 404
    end

    put_or_post "*" do
      status 404
    end

    delete "*" do
      status 404
    end

    not_found do
      json_status 404, "Not found"
    end

    error do
      json_status 500, env['sinatra.error'].message
    end
  end
end