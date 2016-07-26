class StaticPagesController < ApplicationController
  def home
    require 'open-uri'
    news_tmp_file = open('https://news.google.com')
    doc = Nokogiri::HTML(news_tmp_file)

    4.times do puts doc end
  end

  def help
  end

  def about
  end

  def contact
  end

end
