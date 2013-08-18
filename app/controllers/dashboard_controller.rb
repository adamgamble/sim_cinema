class DashboardController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :home

  def home
  end

  def user_home
    @movies = current_user.movies.decorate
  end
end
