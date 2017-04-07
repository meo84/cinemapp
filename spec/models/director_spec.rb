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

end

