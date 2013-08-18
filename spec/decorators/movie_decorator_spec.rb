require 'spec_helper'

describe MovieDecorator do
  let(:movie) { FactoryGirl.create(:movie) }
  let(:movie_decorator) { MovieDecorator.decorate(movie) }

  describe "should display methods all pretty and stuff" do
    it "should display a pretty budget" do
      movie_decorator.budget.should == helper.number_to_currency(movie.budget)
    end

    it "should display a pretty revenue" do
      movie_decorator.revenue.should == helper.number_to_currency(movie.revenue)
    end

    it "should display a pretty profit" do
      movie_decorator.profit.should == helper.number_to_currency(movie.profit)
    end
  end
end
