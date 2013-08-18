class MovieStudio < ActiveRecord::Base
  has_many :proposals

  def movies
    Movie.joins(:proposals).where("movies.accepted_proposal_id = proposals.id").where("proposals.movie_studio_id = #{self.id}")
  end
end
