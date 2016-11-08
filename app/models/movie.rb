class Movie < ActiveRecord::Base
	has_many :events, as: :activity
end
