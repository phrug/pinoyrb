class Affiliation < ActiveRecord::Base
  belongs_to :entity, :inverse_of => :affiliations
  belongs_to :user, :inverse_of => :affiliations
end
