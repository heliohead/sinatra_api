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
  property :longitude, String
  property :latitude, String
  property :up_votes, Integer, default: 0
  property :down_votes, Integer, default: 0
  property :created_at, Time
  property :updated_at, Time
end

class CabDriver
  include DataMapper::Resource

  property :id, Serial, key: true
  property :name, String
  property :email, String
  property :password, BCryptHash
  property :password, BCryptHash
  property :geo_longitude, String
  property :geo_latitude, String
  property :up_votes, Integer, default: 0
  property :down_votes, Integer, default: 0
  property :busy, Integer, default: false
  property :created_at, Time
  property :updated_at, Time
end

DataMapper.finalize
DataMapper.auto_upgrade!