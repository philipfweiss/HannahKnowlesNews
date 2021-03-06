desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do

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
    if Article.where(:title => item.pagemap.metatags[0]["og:title"]).blank? && Article.where(:link => item.link).blank?
      Article.create!(
          title: item.pagemap.metatags[0]["og:title"],
          content: '',
          published_date: item.pagemap.metatags[0].startdate,
          location: 'merc',
          link: item.link
      )

      @emails = Email.all
      @emails.each do |email|
        HannahMailer.news_email("#{item.pagemap.metatags[0]["og:title"]}", item.link, email.email).deliver_now
      end

    end
  end

  ######

  @sac = []
  2.times do |x|
    sac = GoogleCustomSearchApi.search("Hannah Knowles Sac Bee", :page => x )
    sac.items.each do |item|
      if !item.pagemap.nil?
        @sac.push item
      end
    end

    @sac.each do |item|
      if Article.where(:title => item.pagemap.metatags[0]["og:title"]).blank? && Article.where(:link => item.link).blank?
        Article.create!(
            title: item.pagemap.metatags[0]["og:title"],
            content: '',
            published_date: item.pagemap.metatags[0].startdate,
            location: 'sacbee',
            link: item.link
        )

        @emails = Email.all
        @emails.each do |email|
          HannahMailer.news_email("#{item.pagemap.metatags[0]["og:title"]}", item.link, email.email).deliver_now
        end

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

      @emails = Email.all
      @emails.each do |email|
        HannahMailer.news_email(entry.title, entry.url, email.email).deliver_now
      end

    end

  end

  end
end