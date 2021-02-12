class SearchController < ApplicationController
  def index
    binding.pry
    @results = find_by_nation(params[:nation])
  end
end