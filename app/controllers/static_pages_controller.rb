class StaticPagesController < ApplicationController
  def home
    @email = Email.new

    @articles = []
    Article.all.each do |item|
      @articles.push (item)
    end
    @articles = @articles.sort_by {|a| a.published_date.to_date}

    @articles.reverse!
    #HannahMailer.news_email(@articles.first.title, @articles.first.link, "philipfweiss@gmail.com").deliver_now

  end

  def landing
  end


  def help
  end

  def about
  end

  def contact
  end

end
