require 'bcrypt'
DataMapper.setup(:default, "sqlite://#{Dir.pwd}/db.sqlite")

module Validation
  def valid_id?(id)
    id && id.to_s =~ /^\d+$/
  end
end

class Passenger
  include DataMapper::Resource
  include BCrypt
  extend Validation

  property :id, Serial, key: true
  property :name, String
  property :email, String
  property :password, BCryptHash, :reader => :protected
  property :longitude, Float
  property :latitude, Float
  property :up_votes, Integer, default: 0
  property :down_votes, Integer, default: 0
  property :created_at, Time
  property :updated_at, Time
end

class Cab
  include DataMapper::Resource

  property :id, Serial, key: true
  property :name, String
  property :email, String
  property :password, BCryptHash
  property :service_type, String
  property :geo_longitude, Float
  property :geo_latitude, Float
  property :up_votes, Integer, default: 0
  property :down_votes, Integer, default: 0
  property :busy, Boolean, default: false
  property :created_at, Time
  property :updated_at, Time
end

DataMapper.finalize
DataMapper.auto_upgrade!