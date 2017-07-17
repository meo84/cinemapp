FactoryGirl.define do
  factory :movie do
    title "Some movie title"
    year 2017
    poster_url "some_movie_poster.jpg"

    factory :movie_with_event do
      transient do
        attendees_count 5
      end

      after(:create) do |movie, evaluator|
        create(:event, attendees_nb: evaluator.attendees_count, activity: movie)
      end
    end

    factory :movie_with_directors do
      transient do
        director_count 1
      end

      after(:create) do |movie, evaluator|
        evaluator.director_count.times do
          create(:director, movies: [ movie ])
        end
      end
    end
  end
end
