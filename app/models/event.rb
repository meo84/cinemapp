class Event < ActiveRecord::Base
  validates :title, :description, :attendees_nb, :venue, :meetup_id, :date, presence: true

  belongs_to :activity, polymorphic:true
end
