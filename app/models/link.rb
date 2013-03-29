class Link < ActiveRecord::Base
  belongs_to :linkable, :polymorphic => true, :inverse_of => :links
  attr_accessible :link_type, :linkable_id, :linkable_type, :url

  LINK_TYPES = %w(website github facebook twitter linkedin gplus pinterest)

  validates :url, :presence => true
  validates :link_type, :inclusion => { :in => LINK_TYPES }, :presence => true

  def link_type_enum
    LINK_TYPES
  end
end
