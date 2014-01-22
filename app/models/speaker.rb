class Speaker < ActiveRecord::Base
  belongs_to :presentation, :inverse_of => :speakers
  belongs_to :user, :inverse_of => :speakers, :touch => true
end
