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
		@directors = Director.order(:last_name)
	end

	def new
    @director = Director.new
  end

  def create
    @director = Director.new director_params
    @director.save!
    redirect_to action: 'index'
  end

  private

  def director_params
    params.require(:director).permit(:first_name, :last_name, :country)
  end

end