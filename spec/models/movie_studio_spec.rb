require 'spec_helper'

describe MovieStudio do

  describe "proposals" do
    let(:movie_studio) { FactoryGirl.create(:movie_studio) }
    before do
      5.times do
        FactoryGirl.create(:proposal, movie_studio: movie_studio)
      end
      @accepted_proposal = movie_studio.proposals.first
      @accepted_movie = @accepted_proposal.movie
      @accepted_movie.accepted_proposal = @accepted_proposal
      @accepted_movie.save
    end

    it "should have movies" do
      movie_studio.movies.count.should == 1
      movie_studio.movies.include?(@accepted_movie).should be_true
    end
  end
end
