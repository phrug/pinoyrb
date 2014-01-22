class Venue < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  has_many :events, :inverse_of => :venue

  validates :name, :latitude, :longitude, :presence => true

end
