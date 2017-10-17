# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development? || Rails.env.test?
  AdminUser.create(email: 'admin@pinoyrb.org', password: 'pinoyrborg')

  # Creates Ruby users, presentations and events where the presentations were held.
  (1..10).each do |n|
    user = User.create!(name: "Ruby User #{n}", email: "user_#{n}@pinoyrb.org", password: 'pinoyrborg')
    n.times do |presentation_count|
      event = Event.find_or_create_by!(name: "Event #{presentation_count}", event_type: 'meetup')
      presentation = Presentation.create!(name: "Presentation #{presentation_count}", event: event)
      Speaker.create!(presentation: presentation, user: user)
    end
  end
end
