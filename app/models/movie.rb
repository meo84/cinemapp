class Movie < ActiveRecord::Base
	has_many :events, as: :activity

	def self.rank_by_attendance(rank)
		ranks = Movie.all.sort_by { |movie| movie.events.last.attendees_nb }.reverse!
		return ranks[rank-1]
	end

	scope :order_by_year, -> { all.order("year") }

	scope :oldest, -> { order_by_year.first }

	scope :latest, -> { order_by_year.last }

end
