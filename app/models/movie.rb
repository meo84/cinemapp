class Movie < ActiveRecord::Base
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

end
