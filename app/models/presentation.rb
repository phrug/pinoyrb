class Presentation < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  belongs_to :event, :inverse_of => :presentations
  has_many :speakers, :inverse_of => :presentation
  has_many :users, :through => :speakers
  has_many :presentation_tags
  has_many :tags, through: :presentation_tags, inverse_of: :presentations
end
