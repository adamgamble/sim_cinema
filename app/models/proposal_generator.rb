class ProposalGenerator
  module Exceptions
    class MissingMovieError < StandardError; end
  end

  attr_accessor :movie
  def initialize options = {}
    @movie = options.fetch(:movie) { raise Exceptions::MissingMovieError }
  end

  def generate!
    movie_studios.each do |movie_studio|
      movie.proposals.create(movie_studio: movie_studio, amount: offer_for_movie_studio(movie_studio))
    end
  end

  private
  def offer_for_movie_studio movie_studio
    rand(100)
  end

  def movie_studios
    MovieStudio.all
  end
end
