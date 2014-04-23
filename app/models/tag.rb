class Tag < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :presentation_tags
  has_many :presentations, through: :presentation_tags, inverse_of: :tags
end
