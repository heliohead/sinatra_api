module Api
  class App < Sinatra::Base
    helpers do
      def json_status(code, reason)
        status code
        { :status => code, :reason => reason }.to_json
      end

      def accept_params(params, *fields)
        h = { }
        fields.each do |name|
          h[name] = params[name] if params[name]
        end
        h
      end
    end
  end
end