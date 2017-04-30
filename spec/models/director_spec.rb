require 'rails_helper'

RSpec.describe Director, type: :model do

  describe "Validations" do

    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:country) }

    it "is not valid without a 2-uppercase-letters country" do
      should_not allow_value("some c0untry").for(:country)
      should allow_value("AU").for(:country)
    end

  end

  describe "Associations" do

    it { should have_many(:movies).through(:directors_movies) }
    it { should have_many(:directors_movies) }

  end

  context "Methods" do

    let!(:gold_director) do
      FactoryGirl.create :director_with_movies, movies_count: 3
    end
    let!(:silver_director) do
      FactoryGirl.create :director_with_movies, movies_count: 2
    end
    let!(:bronze_director) do
      FactoryGirl.create :director_with_movies, movies_count: 1
    end
    let!(:other_director) do
      FactoryGirl.create :director
    end

    describe ".most_watched" do
      it "returns array of three directors most watched by the group" do
        expect(Director.most_watched(3)).to eq [gold_director, silver_director, bronze_director]
      end
    end

  end
end

