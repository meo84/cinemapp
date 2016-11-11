class Director < ActiveRecord::Base
	has_many :movies
	has_many :directors_movies
	has_many :movies, through: :directors_movies
end
