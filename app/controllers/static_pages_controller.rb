class StaticPagesController < ApplicationController
  def home
    @results = GoogleCustomSearchApi.search("Hannah Knowles")
  end


  def help
  end

  def about
  end

  def contact
  end

end
