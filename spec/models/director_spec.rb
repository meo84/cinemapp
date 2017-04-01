require 'rails_helper'

RSpec.describe Director, type: :model do

  describe "Validations" do

    it "is not valid without a first name" do
      should validate_presence_of(:first_name)
    end

    it "is not valid without a last name" do
      should validate_presence_of(:last_name)
    end

    it "is not valid without a country" do
      should validate_presence_of(:country)
    end

    it "is not valid without a 2-uppercase-letters country" do
      should_not allow_value("some c0untry").for(:country)
      should allow_value("AU").for(:country)
    end
  end

  describe "Associations" do
    it { should have_many(:movies).through(:directors_movies) }
    it { should have_many(:directors_movies) }
  end

end

