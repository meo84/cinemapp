module Meetup

	class Event
		# group_name: The-Arthouse-Film-Club
		# params: status=past,upcoming
		# and key=ENV(MEETUP_KEY)
		def self.get_events(group_name, params={}) 

		hash_params = params.to_query.gsub("%2C",",")
	 
		url = URI.parse("https://api.meetup.com/#{group_name}/events?#{hash_params}")
		
		puts url

		result = Net::HTTP.get(url)
		jason_result = JSON.parse(result)
		
		end

	end

end