require 'rails_helper'

RSpec.describe Event, type: :model do

  describe "Validations" do

    it "is not valid without a title" do
      should validate_presence_of(:title)
    end

    it "is not valid without a description" do
      should validate_presence_of(:description)
    end

    it "is not valid without a attendees_nb" do
      should validate_presence_of(:attendees_nb)
    end

    it "is not valid without a venue" do
      should validate_presence_of(:venue)
    end

    it "is not valid without a meetup_id" do
      should validate_presence_of(:meetup_id)
    end

    it "is not valid without a date" do
      should validate_presence_of(:date)
    end

  end

  describe "Associations" do
    it { should belong_to(:activity) }
  end
end
