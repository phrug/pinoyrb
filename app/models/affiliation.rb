class Affiliation < ActiveRecord::Base
  belongs_to :entity, :inverse_of => :affiliations
  belongs_to :user, :inverse_of => :affiliations
  attr_accessible :current, :position, :user_id, :entity_id
end
