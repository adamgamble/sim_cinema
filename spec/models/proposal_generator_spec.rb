require 'spec_helper'
describe ProposalGenerator do
  context "initializing without a movie" do
    it "should raise" do
      lambda { described_class.new }.should raise_exception(ProposalGenerator::Exceptions::MissingMovieError)
    end
  end

  context "generating proposals" do
    let(:movie) { FactoryGirl.create(:movie) }
    let(:proposal_generator) { ProposalGenerator.new(:movie => movie) }

    before do
      5.times do
        FactoryGirl.create(:movie_studio)
      end
    end

    it "should generate one or less proposals for each movie studio" do
      proposal_generator.generate!
      movie.proposals.count.should be > 0
      movie.proposals.count.should be <= 5
    end
  end
end
