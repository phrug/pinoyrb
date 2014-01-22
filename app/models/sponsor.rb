class Sponsor < ActiveRecord::Base
  belongs_to :event, :inverse_of => :sponsors
  belongs_to :entity, :inverse_of => :sponsors

  ROLES = %w(organizer sponsor supporter)

  validates :role, :inclusion => { :in => ROLES }

  def role_enum
    ROLES
  end
end
