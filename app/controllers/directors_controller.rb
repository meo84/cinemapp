class DirectorsController < ApplicationController

	def who_graph
		@directors_podium = [ Director.rank_by_movie_nb(1), Director.rank_by_movie_nb(2), Director.rank_by_movie_nb(3) ]

		respond_to do |format|
      		format.js 
      		format.json { render json: @directors_podium }
      		format.html
    	end
	end

	def index
		@directors = Director.all
	end

end