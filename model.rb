require 'geocoder'
require 'bcrypt'

Geocoder.configure(lookup: :google, timeout: 3, units: :km)

class Passenger < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord
  has_secure_password
  geocoded_by :address
  after_validation :geocode
  validates_presence_of :name, :password, :email
  validates_uniqueness_of :email
end

class Cab < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord
  has_secure_password
  geocoded_by :address
  after_validation :geocode
  validates_presence_of :name, :password, :email
  validates_uniqueness_of :email
end