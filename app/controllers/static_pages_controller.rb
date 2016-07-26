class StaticPagesController < ApplicationController
  def home


    @articles = []
    Article.all.each do |item|
      @articles.push (item)
    end
    @articles = @articles.sort_by {|a| a.published_date.to_date}

    @articles.reverse!
    HannahMailer.news_email().deliver_now



  end



  def help
  end

  def about
  end

  def contact
  end

end
