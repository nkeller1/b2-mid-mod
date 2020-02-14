class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end

  def update
    require "pry"; binding.pry
  end
end
