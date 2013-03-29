class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  belongs_to :venue, :inverse_of => :events
  has_many :sponsors, :inverse_of => :event
  has_many :entities, :through => :sponsors
  has_many :presentations, :order => "display_order", :inverse_of => :event
  has_many :links, :as => :linkable, :inverse_of => :linkable
  attr_accessible :description, :end_at, :event_type, :name, :start_at, :venue_id, :youtube_playlist

  attr_accessible :links_attributes, :allow_destroy => true
  accepts_nested_attributes_for :links, :allow_destroy => true
  attr_accessible :link_ids

  EVENT_TYPES = %w(meetup seminar workshop)

  validates :name, :presence => true
  validates :event_type, :inclusion => { :in => EVENT_TYPES }

  scope :upcoming, where("start_at > current_timestamp").order("start_at")
  scope :current, where("start_at <= current_timestamp and end_at >= current_timestamp").order("start_at")
  scope :past, where("end_at < current_timestamp").order("end_at DESC")
  scope :meetups, where("event_type = 'meetup'")
  scope :include_children, includes([:sponsors, :entities, { :presentations => { :speakers => :user }}])

  def event_type_enum
    EVENT_TYPES
  end
end
