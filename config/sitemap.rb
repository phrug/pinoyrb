# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://pinoyrb.org"

SitemapGenerator::Sitemap.create do
  add learn_path
  add events_path, :priority => 0.7, :changefreq => 'daily'

  Event.all.each do |event|
    add event_path(event), :lastmod => event.updated_at
  end

  add users_path, :priority => 0.7, :changefreq => 'montly'

  User.all.each do |user|
    add user_path(user), :lastmod => user.updated_at
  end
end
