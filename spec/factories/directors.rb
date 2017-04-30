FactoryGirl.define do
  factory :director do
    first_name "Mike"
    last_name "Nichols"
    country "US"

    factory :director_with_movies do
      transient do
        movies_count 1
      end

      after(:create) do |director, evaluator|
        create_list(:movie, evaluator.movies_count, directors: [ director ])
      end
    end
  end
end
