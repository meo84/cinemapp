class WelcomeController < ApplicationController

	def home
		@movies_podium = [ Movie.rank_by_attendance(1), Movie.rank_by_attendance(2), Movie.rank_by_attendance(3)]
		@oldest_movie = Movie.oldest
		@latest_movie = Movie.latest
	end

end