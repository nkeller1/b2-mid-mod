class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    name = params[:name]
    actor = Actor.find_by(name: name)
    movie.actors << actor
    redirect_to "/movies/#{movie.id}"
  end
end
