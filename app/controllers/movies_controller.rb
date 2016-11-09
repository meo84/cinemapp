class MoviesController < ApplicationController

	def when_graph
		@movies_podium = [ Movie.rank_by_attendance(1), Movie.rank_by_attendance(2), Movie.rank_by_attendance(3)]
		@oldest_movie = Movie.oldest
		@latest_movie = Movie.latest

		@nb_movies_by_step = Movie.count_by_step(1930,2010,10)

		respond_to do |format|
      		format.js 
      		format.json { render json: @nb_movies_by_step }
      		format.html
    	end
	end

end