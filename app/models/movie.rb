require 'utilities'

class Movie < ActiveRecord::Base
  validates_presence_of :title

  has_many :events, as: :activity
  has_many :directors
  has_many :directors_movies
  has_many :directors, through: :directors_movies

  def self.rank_by_attendance(rank)
    Movie.all.sort_by(&:last_event_turnout).reverse![rank-1]
  end

  def last_event_turnout
    events.last.attendees_nb
  end

  scope :order_by_year, -> { all.order("year") }

  scope :oldest, -> { order_by_year.first }

  scope :latest, -> { order_by_year.last }

  scope :count_by_years, -> (start_yr, step) { where "year >= ? and year < ?", start_yr, start_yr + step }

  def self.count_by_step(start_yr,end_yr,step)
    count_by_step = []
    (start_yr .. end_yr).step(step) do |yr|
      movie_count = Movie.count_by_years(yr,step).size
      coordinates = { x: yr.to_s + 's', y: movie_count }
      count_by_step.push coordinates
    end
    return count_by_step
  end

  #analyse nb of movies seen in each country
  def country_set
    directors.first ? directors.first.country : ""
  end

  scope :count_by_country, -> (country) { where "country_set == ?", country }

  def self.group_by_country

    movies_by_country = Movie.all.group_by { |movie| movie.country_set }
    group_country = []
    movies_by_country.keys.each do |key|
      country_deets = {
        "title": ISO3166::Country.find_country_by_alpha2(key).name,
        "id": key,
        "color": Utilities::MapLegend.new.country_color(movies_by_country[key].count),
        "customData": movies_by_country[key].count
      }
      group_country << country_deets
    end
    return group_country
  end
end
