class SearchController < ApplicationController
  def index
    @poems = PoemService.new.poems_with_analysis(params[:author])
  end
end
