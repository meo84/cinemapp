class Director < ActiveRecord::Base
  validates :first_name, :last_name, :country, presence: true
  validates_format_of :country, with: /\A[A-Z]{2}\z/

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
