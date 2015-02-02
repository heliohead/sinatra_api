require 'bcrypt'
DataMapper.setup(:default, "sqlite://#{Dir.pwd}/db.sqlite")

class Passenger
  include DataMapper::Resource
  include BCrypt

  property :id, Serial, key: true
  property :name, String
  property :email, String
  property :password, BCryptHash
  property :geo_longitude, String
  property :geo_latitude, String
  property :up_votes, Integer, default: 0
  property :down_votes, Integer, default: 0
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
end

DataMapper.finalize
DataMapper.auto_upgrade!