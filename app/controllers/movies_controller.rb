require 'utilities'

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

	def where_graph

		@legend_with_text = Utilities::MapLegend.new.legend_with_text()
		
		@nb_movies_by_country = Movie.group_by_country
		respond_to do |format|
      		format.js 
      		format.json { render json: @nb_movies_by_country }
      		format.html
    	end

    	puts @nb_movies_by_country
	end

end