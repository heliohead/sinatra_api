module Api
  class Routes < Sinatra::Base
    get '/' do
      content_type :json
      return {:testing => [ 'foo', 'bar', 'baz', 1, 2, 3 ]}.to_json
    end
  end
end