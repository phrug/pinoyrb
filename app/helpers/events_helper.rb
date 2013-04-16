module EventsHelper
  def next_meetup(event = nil)
    if event.nil?
      "#{l next_3rd_thurs(Date.today), :format => :long}, venue TBA"
    else
      link_to "#{l event.start_at.to_date, :format => :long}, #{event.venue.nil? ? "venue TBA" : "at #{event.venue.name}"}", event
    end
  end

  def next_3rd_thurs(current_date)
    if current_date > third_thurs(current_date)
      if current_date.month == 12
        third_thurs(Date.new(current_date.year + 1, 1, 1))
      else
        third_thurs(Date.new(current_date.year, current_date.month + 1, 1))
      end
    else
      third_thurs(current_date)
    end
  end

  def third_thurs(current_date)
    date = Date.new(current_date.year, current_date.month, 1)
    date + (((4 - date.wday) % 7).days + 14.days)
  end
end
