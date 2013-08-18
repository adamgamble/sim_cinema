class MoviesController < ApplicationController
  def index
    @movies = MovieDecorator.decorate(current_user.movies)
  end

  def new
    @movie = current_user.movies.new(params[:movie])
  end

  def create
    @movie = current_user.movies.new(movie_params)

    if @movie.save
      redirect_to @movie
    else
      render action: :new
    end
  end

  private
  def movie_params
    params.require(:movie).permit(:name)
  end
end
