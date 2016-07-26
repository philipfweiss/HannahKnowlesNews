class StaticPagesController < ApplicationController
  def home
    require 'open-uri'
    tmp = open('https://www.google.com/?gws_rd=ssl#q=hannah+knowles&tbm=nws&tbs=qdr:m')
    doc = Nokogiri::HTML(tmp)
    @content = doc

  end

  def help
  end

  def about
  end

  def contact
  end

end
