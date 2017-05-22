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
  end
end
