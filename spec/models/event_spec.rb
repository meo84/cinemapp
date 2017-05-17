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

  context "Methods" do

    let!(:event) { FactoryGirl.create :event }
    let!(:other_event) { FactoryGirl.create :event, title: "Other movie outing" }

    describe "#image_urls" do
      it "gets the links of the images included in the event description" do
        expect(event.image_urls).to eq ["http://photos1.meetupstatic.com/photos/event/a/4/7/b/600_458082107.jpeg"]
      end
    end

    describe "#first_image_url" do
      it "gets the link of the first image included in the event description" do
        expect(event.first_image_url).to eq "http://photos1.meetupstatic.com/photos/event/a/4/7/b/600_458082107.jpeg"
      end
    end

    describe "#preview" do
      it "returns id, title and first image link of given event" do
        preview = { "id": event.id, "title": event.title, "first_image_url": event.first_image_url }
        expect(event.preview).to eq preview
      end
    end

    describe ".summary" do
      it "returns array of all event previews" do
        expect(Event.summary.count).to eq Event.count
        expect(Event.summary[0]).to eq Event.all[0].preview
      end
    end

  end

end
