class Event < ActiveRecord::Base

  validates :title, :description, :attendees_nb, :venue, :meetup_id, :date, presence: true
  belongs_to :activity, polymorphic:true

  def image_urls
    url_arrays = description.scan(/src=\"([^\"]+)\"/)
    url_arrays.map { |url_array| url_array[0] }
  end

  def first_image_url
    image_urls.first
  end

  def self.summary
    all.map do |event|
      {
        "id": event.id,
        "title": event.title,
        "first_image_url": event.first_image_url
      }
    end
  end
end
