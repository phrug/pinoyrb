class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  has_many :contributors, :as => :contributable, :inverse_of => :contributable
end
