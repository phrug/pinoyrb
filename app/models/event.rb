class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  belongs_to :venue, :inverse_of => :events
  has_many :sponsors, :inverse_of => :event
  has_many :entities, :through => :sponsors
  has_many :presentations, -> { order("display_order") }, :inverse_of => :event
  has_many :links, :as => :linkable, :inverse_of => :linkable
  accepts_nested_attributes_for :links, :allow_destroy => true

  EVENT_TYPES = %w(meetup seminar workshop)

  validates :name, :presence => true
  validates :event_type, :inclusion => { :in => EVENT_TYPES }

  scope :upcoming, -> { where("start_at > current_timestamp").order("start_at") }
  scope :current, -> { where("start_at <= current_timestamp and end_at >= current_timestamp").order("start_at") }
  scope :past, -> { where("end_at < current_timestamp").order("end_at DESC") }
  scope :meetups, -> { where("event_type = 'meetup'") }
  scope :include_children, -> { includes([{ :sponsors =>  :entity }, { :presentations => { :speakers => :user }}]) }

  def event_type_enum
    EVENT_TYPES
  end

  def description_html
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true).render(description)
  end

  def gmap_json
    venue.nil? ? "" : [venue].to_gmaps4rails
  end

  def to_ical_event
    ical_event = Icalendar::Event.new

    ical_event.dtstart     = start_at.to_s(:ical_local)
    ical_event.dtend       = end_at.to_s(:ical_local)
    ical_event.summary     = "#{name} (#{event_type})"
    ical_event.description = description

    unless venue.nil?
      ical_event.location = venue.address
      ical_event.geo      = "#{venue.latitude};#{venue.longitude}"
    end

    ical_event
  end
end
