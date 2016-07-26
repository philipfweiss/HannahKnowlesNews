class StaticPagesController < ApplicationController
  def home

    @merc = []
    10.times do |x|
      merc = GoogleCustomSearchApi.search("Hannah Knowles Mercury News", :page => x )
      merc.items.each do |item|
        @merc.push item
      end
    end

    @daily = []
    10.times do |x|
      daily = GoogleCustomSearchApi.search("Hannah Knowles Stanford Daily", :page => x)
      daily.items.each do |item|
        @daily.push item
      end
    end
  end


  def help
  end

  def about
  end

  def contact
  end

end
