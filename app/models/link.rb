class Link < ActiveRecord::Base
  belongs_to :linkable, :polymorphic => true, :inverse_of => :links

  LINK_TYPES = %w(website github facebook twitter linkedin gplus pinterest)
  LINK_TYPE_FA_LOOKUP = Hash[LINK_TYPES.zip(%w(fa-icon-external-link-sign fa-icon-github fa-icon-facebook fa-icon-twitter fa-icon-linkedin fa-icon-google-plus fa-icon-pinterest))]

  validates :url, :presence => true
  validates :link_type, :inclusion => { :in => LINK_TYPES }, :presence => true

  def link_type_enum
    LINK_TYPES
  end
end
