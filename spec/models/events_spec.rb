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

  describe "#image_urls" do
    it "gets the links of the images included in the event description" do
      event = Event.new(description: "<p><img src=\"http://photos1.meetupstatic.com/photos/event/a/4/7/b/600_458082107.jpeg\" /></p> <p>It's Thomas Vinterberg's latest and I'm excited! Come see it with me at the Luminor near Hotel de Ville. It's on at 7pm on Tues, so let's meet outside around 6.45pm, get tickets etc. And go for a drink after?</p> <p>More details:</p> <p><a href=\"http://www.luminor-hoteldeville.com/film/la-communaute-2017/\" class=\"linkified\">http://www.luminor-hoteldeville.com/film/la-communaute-2017/</a></p>")
      assert_equal ["http://photos1.meetupstatic.com/photos/event/a/4/7/b/600_458082107.jpeg"], event.image_urls
    end
  end
end
