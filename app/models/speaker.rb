class Speaker < ActiveRecord::Base
  belongs_to :presentation, :inverse_of => :speakers
  belongs_to :user, :inverse_of => :speakers
  attr_accessible :custom_bio, :presentation_id, :user_id
end
