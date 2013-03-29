class Sponsor < ActiveRecord::Base
  belongs_to :event, :inverse_of => :sponsors
  belongs_to :entity, :inverse_of => :sponsors
  attr_accessible :role, :event_id, :entity_id

  ROLES = %w(organizer sponsor supporter)

  validates :role, :inclusion => { :in => ROLES }

  def role_enum
    ROLES
  end
end
