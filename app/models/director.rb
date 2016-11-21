class Director < ActiveRecord::Base
	has_many :movies
	has_many :directors_movies
	has_many :movies, through: :directors_movies

	def self.rank_by_movie_nb(rank)
		Director.all.sort_by(&:movie_nb).reverse![rank-1]
	end

	def movie_nb
		movies.count
	end

	def fullname
		first_name + ' ' + last_name
	end
end
