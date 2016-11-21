class WelcomeController < ApplicationController

	def home
		@movies_podium = [ Movie.rank_by_attendance(1), Movie.rank_by_attendance(2), Movie.rank_by_attendance(3)]
		@oldest_movie = Movie.oldest
		@latest_movie = Movie.latest

		@directors_podium = [ Director.rank_by_movie_nb(1), Director.rank_by_movie_nb(2), Director.rank_by_movie_nb(3) ]
	end

end