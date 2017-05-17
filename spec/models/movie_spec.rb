require 'rails_helper'

RSpec.configure do |config|
  config.before(:example, :seed_data) do
    @gold_movie = FactoryGirl.create :movie_with_event, attendees_count: 20
    @silver_movie = FactoryGirl.create :movie_with_event, attendees_count: 15
    @bronze_movie = FactoryGirl.create :movie_with_event, attendees_count: 10
    @other_movie = FactoryGirl.create :movie_with_event, attendees_count: 5
  end
end

RSpec.describe Movie, type: :model do

  describe "Validations" do

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:poster_url) }

    it "is not valid without a 4-digit year greater than 1900" do
      should allow_value(1950).for(:year)
      should_not allow_value(10000).for(:year)
    end

  end

  describe "Associations" do

    it { should have_many(:directors).through(:directors_movies) }
    it { should have_many(:directors_movies) }
    it { should have_many(:events) }

  end

  context "Methods" do

    describe ".most_attended" do

      it "returns array of three movies with most group participants", :seed_data do
        expect(Movie.most_attended(3)).to eq [@gold_movie, @silver_movie, @bronze_movie]
      end

      it "returns empty array if there are no movies in the database" do
        expect(Movie.most_attended(3)).to eq []
      end
    end

  end

end
