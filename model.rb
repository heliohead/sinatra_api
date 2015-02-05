require 'geocoder'
require 'bcrypt'

Geocoder.configure(lookup: :google, timeout: 3, units: :km)

class Passenger < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord
  has_secure_password
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  validates_presence_of :name, :password, :email
  validates_uniqueness_of :email
  has_many :cabs, through: :rides
  has_many :rides
end

class Cab < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord
  has_secure_password
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  validates_presence_of :name, :password, :email
  validates_uniqueness_of :email
  has_many :passengers, through: :rides
  has_many :rides
end

class Ride < ActiveRecord::Base
  belongs_to :passengers
  belongs_to :cabs
  validates_presence_of :starts_at, :ends_at
end