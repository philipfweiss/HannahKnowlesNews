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

  def letsencrypt
    # use your code here, not mine
    render text: "9q378m_JWtqFSpeETTu6tv8BurdP3jUEm7y33NJS960.qmJD-TSCy_zWbNn1rAmVvL_12D1e-k0llmrEEQvixkc"
  end

end
