class SearchController < ApplicationController
  def index
    @results = CharactersFacade.find_by_nation(params[:nation])
  end
end