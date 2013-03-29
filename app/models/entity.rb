class Entity < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  belongs_to :venue
  has_many :affiliations, :inverse_of => :entity
  has_many :users, :through => :affiliations
  has_many :contributors, :as => :contributable, :inverse_of => :contributable
  has_many :projects, :through => :contributors
  has_many :links, :as => :linkable, :inverse_of => :linkable
  attr_accessible :description, :display, :entity_type, :name, :recruiting, :slug

  attr_accessible :links_attributes, :allow_destroy => true
  accepts_nested_attributes_for :links, :allow_destroy => true
  attr_accessible :link_ids

  ENTITY_TYPES = %w(company organization school)

  validates :role, :inclusion => { :in => ENTITY_TYPES }

  def entity_type_enum
    ENTITY_TYPES
  end
end
