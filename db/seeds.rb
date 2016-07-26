# User.create!(name:  "Example User",
#              email: "example@railstutorial.org",
#              password:              "foobar",
#              password_confirmation: "foobar",
#              admin:     true,
#              activated: true,
#              activated_at: Time.zone.now)
#
# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password,
#                activated: true,
#                activated_at: Time.zone.now)
# end


@merc = []
2.times do |x|
  merc = GoogleCustomSearchApi.search("Hannah Knowles Mercury News", :page => x )
  merc.items.each do |item|
    if !item.pagemap.nil? && item.pagemap.metatags[0].has_key?("startdate")
      @merc.push item
    end
  end
end

@merc.each do |item|
  if Article.where(:title => item.pagemap.metatags[0]["og:title"]).blank?
    Article.create!(
        title: item.pagemap.metatags[0]["og:title"],
        content: '',
        published_date: item.pagemap.metatags[0].startdate,
        location: 'merc',
        link: item.link
    )
  end
end


######

@daily = []
url = "http://www.stanforddaily.com/author/hannah-knowles/feed/"
feed = Feedjira::Feed.fetch_and_parse url
feed.entries.each do |entry|
  if Article.where(:title => entry.title).blank?
    Article.create!(
               title: entry.title,
               content: '',
               published_date: entry.published.to_date,
               location: 'daily',
               link: entry.url
    )

  end

end