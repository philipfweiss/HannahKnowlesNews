class StaticPagesController < ApplicationController
  def home


    @articles = []
    Article.all.each do |item|
      @articles.push (item)
    end
    @articles = @articles.sort_by {|a| a.published_date.to_date}
    @articles.reverse!
    @articles.each do |art|
      puts art
    end
    @articles = @articles.paginate(:page => params[:page], :per_page => 10)



  end



  def help
  end

  def about
  end

  def contact
  end

end
