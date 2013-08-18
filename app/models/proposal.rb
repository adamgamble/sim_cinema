class Proposal < ActiveRecord::Base
  belongs_to :movie
  belongs_to :movie_studio
end
