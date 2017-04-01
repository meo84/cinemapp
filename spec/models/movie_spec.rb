require 'rails_helper'

RSpec.describe Movie, type: :model do

  describe "Validations" do
    it "is not valid without a title" do
      should validate_presence_of(:title)
    end

    it "is not valid without a year" do
      should validate_presence_of(:year)
    end

    it "is not valid without a 4-digit year greater than 1900" do
      should allow_value(1950).for(:year)
      should_not allow_value(10000).for(:year)
    end

    it "is not valid without a poster URL" do
      should validate_presence_of(:poster_url)
    end
  end

  describe "Associations" do
    it { should have_many(:directors).through(:directors_movies) }
    it { should have_many(:directors_movies) }
    it { should have_many(:events) }
  end
end
