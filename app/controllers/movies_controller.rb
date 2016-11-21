class MoviesController < ApplicationController

	def when_graph
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