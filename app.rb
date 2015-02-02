require 'bundler'
Bundler.require

get '/' do
  content_type :json
  return {:testing => [ 'foo', 'bar', 'baz', 1, 2, 3 ]}.to_json
end