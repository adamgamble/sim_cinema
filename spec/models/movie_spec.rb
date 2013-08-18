require 'spec_helper'
describe Movie do
  let(:movie) { Movie.new }

  it "should allow proposal acceptance" do
    movie.accept_proposal!
    movie.state.should == "proposal_accepted"
  end

  describe "proposals" do
    it "should allow many proposals" do
      5.times do
        FactoryGirl.create(:proposal, movie: movie)
      end

      movie.proposals.count.should == 5
    end

    context "accepted proposal" do
      before do
        5.times do
          FactoryGirl.create(:proposal, movie: movie)
        end
        @accepted_proposal = FactoryGirl.create(:proposal, movie: movie)
        movie.accepted_proposal = @accepted_proposal
        movie.save
      end

      it "should have a movie studio" do
        movie.movie_studio.should == @accepted_proposal.movie_studio
      end
    end
  end

  describe "actors" do
    let(:movie) { FactoryGirl.create(:movie) }
    let(:actor) { FactoryGirl.create(:actor) }

    before do
      movie.movie_roles.create(actor: actor)
    end

    it "should receive actors from movie roles" do
      movie.actors.should include(actor)
    end
  end
end
