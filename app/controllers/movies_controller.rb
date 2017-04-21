require 'utilities'

class MoviesController < ApplicationController
before_action :set_directors, only: [:new, :edit, :update]
before_action :set_events, only: [:new, :edit, :update]
before_action :set_movie, only: [:edit, :update]

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
    @movies = Movie.order(id: :desc)
  end

  def new
    @movie = Movie.new
    respond_to do |format|
      format.json { render json: @events.summary }
      format.html
    end
  end

  def create
    @movie = Movie.new movie_params
    @movie.save!
    redirect_to action: 'index'
  end

  def edit
  end

  def update
    @movie.update movie_params
    redirect_to action: 'index'
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :year, :poster_url, :director_ids => [], :event_ids => [])
  end

  def set_movie
    @movie = Movie.find params[:id]
  end

  def set_directors
    @directors = Director.order(:last_name)
  end

  def set_events
    @events = Event.order(:id).where activity: nil
  end

end
