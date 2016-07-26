class StaticPagesController < ApplicationController
  def home
    results = GoogleCustomSearch.search("Hannah Knowles")
    @results = results.total
  end


  def help
  end

  def about
  end

  def contact
  end

end
