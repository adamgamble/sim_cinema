class MoviesController < ApplicationController
  def index
    @movies = current_user.movies.decorate
  end

  def new
    @movie = current_user.movies.new(params[:movie])
  end

  def show
    @movie = current_user.movies.find(params[:id]).decorate
  end

  def pitch
    @movie = current_user.movies.find(params[:id])
    generator = ProposalGenerator.new movie: @movie
    generator.generate!
    redirect_to @movie
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
