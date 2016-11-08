class Movie < ActiveRecord::Base
	has_many :events, as: :activity

	def self.rank_by_attendance(rank)
		ranks = Movie.all.sort_by { |movie| movie.events.last.attendees_nb }.reverse!
		return ranks[rank-1]
	end
end
