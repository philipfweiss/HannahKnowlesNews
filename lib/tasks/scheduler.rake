desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do

  @merc = []
  3.times do |x|
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
      HannahMailer.news_email("New Article: #{item.pagemap.metatags[0]["og:title"]}", item.link, "philipfweiss@gmail.com").deliver_now

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
      HannahMailer.news_email("New Article: #{item.pagemap.metatags[0]["og:title"]}", item.link, "philipfweiss@gmail.com").deliver_now

    end

  end

end