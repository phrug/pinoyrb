class Link < ActiveRecord::Base
  belongs_to :linkable, :polymorphic => true, :inverse_of => :links
  attr_accessible :link_type, :linkable_id, :linkable_type, :url

  LINK_TYPES = %w(website github facebook twitter linkedin gplus pinterest)
  LINK_TYPE_FA_LOOKUP = Hash[LINK_TYPES.zip(%w(icon-external-link-sign icon-github icon-facebook icon-twitter icon-linkedin icon-google-plus icon-pinterest))]

  validates :url, :presence => true
  validates :link_type, :inclusion => { :in => LINK_TYPES }, :presence => true

  def link_type_enum
    LINK_TYPES
  end
end
