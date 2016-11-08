class WelcomeController < ApplicationController

	def home
		@movies_podium = [ Movie.rank_by_attendance(1), Movie.rank_by_attendance(2), Movie.rank_by_attendance(3)]
		@movie1 = Movie.rank_by_attendance(1)
		@movie2 = Movie.rank_by_attendance(2)
		@movie3 = Movie.rank_by_attendance(3)
	end

end