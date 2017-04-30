class WelcomeController < ApplicationController

  def home
    @movies_podium = Movie.most_attended(3)
    @oldest_movie = Movie.oldest
    @latest_movie = Movie.latest

    @directors_podium = Director.most_watched(3)
  end

end
