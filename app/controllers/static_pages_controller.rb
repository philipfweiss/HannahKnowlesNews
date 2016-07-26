class StaticPagesController < ApplicationController
  def home

    @merc = []
    1.times do |x|
      merc = GoogleCustomSearchApi.search("Hannah Knowles Mercury News", :page => x )
      puts merc
      merc.items.each do |item|
        if !item.pagemap.nil? && item.pagemap.metatags[0].has_key?("startdate")
          @merc.push item
        end
      end

    end

     @daily = []
  #   1.times do |x|
  #     daily = GoogleCustomSearchApi.search("Hannah Knowles Stanford Daily", :page => x)
  #     daily.items.each do |item|
  #       @daily.push item
  #     end
  #   end
  end



  def help
  end

  def about
  end

  def contact
  end

end
