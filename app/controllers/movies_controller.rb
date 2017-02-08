require 'utilities'

class MoviesController < ApplicationController
before_action :set_directors, only: [:new]

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
    @nb_movies_by_country = Movie.group_by_country

    respond_to do |format|
      format.js
      format.json { render json: @nb_movies_by_country }
      format.html
    end

    puts @nb_movies_by_country
  end

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new movie_params
    @movie.save!
    redirect_to action: 'index'
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :year, :poster_url, :director_ids => [])
  end

  def set_directors
    @directors = Director.order(:last_name)
  end

end
