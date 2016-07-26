class StaticPagesController < ApplicationController
  def home

    @merc = []
    Article.where(:location => 'merc').find_each do |item|
      @merc.push (item)
    end
    @merc = @merc.sort_by {|a| a.published_date.to_date}
    @merc.reverse!



     @daily = []
     1.times do |x|
       daily = GoogleCustomSearchApi.search("Hannah Knowles Stanford Daily", :page => x)
       daily.items.each do |item|
         @display = item
         ### Link: item.link

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
