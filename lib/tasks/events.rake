require 'meetup'

namespace :events  do
  desc 'Get events from the Meetup API'

  task get: :environment do

    #get events from the meetup database
    events = Meetup::Event.get_events('The-Arthouse-Film-Club', {'sign': true, 'status': 'past', 'key': ENV["MEETUP_KEY"], 'fields': 'description'})
    puts events

    # add event if it was created after the last event saved
    events.each do|event|
      event_time = Time.at(event["time"]/1000).to_datetime

      last_event = Event.order(:date).last
      last_time = last_event.nil? ? Time.at(0).to_datetime : last_event["date"]

      if event_time > last_time
        Event.create title: event["name"], attendees_nb: event["yes_rsvp_count"], date: Time.at(event["time"]/1000).to_datetime, meetup_id: event["id"], venue: event["venue"].nil? ? nil : event["venue"]["name"], description: event["description"]
      end
    end
  end
end
