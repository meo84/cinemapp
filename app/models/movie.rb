require 'utilities'

class Movie < ActiveRecord::Base
  validates :title, :year, :poster_url, presence: true
  validates :year, numericality: { only_integer: true, greater_than: 1900, less_than: 3000 }

  has_many :events, as: :activity
  has_many :directors_movies
  has_many :directors, through: :directors_movies

  scope :order_by_year, -> { all.order("year") }
  scope :oldest, -> { order_by_year.first }
  scope :latest, -> { order_by_year.last }
  scope :count_by_years, -> (start_yr, step) { where "year >= ? and year < ?", start_yr, start_yr + step }
  scope :count_by_country, -> (country) { where "country_set == ?", country }

  def self.rank_by_attendance(rank)
    all.sort_by(&:last_event_turnout).reverse![rank-1]
  end

  def self.most_attended(number)
    size = [all.count, number].min
    Array.new(size) { |index| rank_by_attendance(index + 1) }
  end

  def last_event_turnout
    events.last.attendees_nb
  end

  def self.count_by_step(start_yr,end_yr,step)
    count_by_step = []
    (start_yr .. end_yr).step(step) do |yr|
      movie_count = count_by_years(yr,step).size
      coordinates = { y: yr.to_s + 's', x: movie_count }
      count_by_step.push coordinates
    end
    return count_by_step
  end

  def country_set
    directors.first ? directors.first.country : ""
  end

  def self.group_by_country

    movies_by_country = all.group_by { |movie| movie.country_set }
    group_country = []
    movies_by_country.keys.each do |key|
      country_deets = {
        "title": ISO3166::Country.find_country_by_alpha2(key).name,
        "id": key,
        "color": Utilities::MapLegend.country_color(movies_by_country[key].count),
        "customData": movies_by_country[key].count
      }
      group_country << country_deets
    end
    return group_country
  end

end
