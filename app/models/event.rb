class Event < ActiveRecord::Base
	belongs_to :activity, polymorphic:true
        
        def image_urls
          description.scan(/src=\"([^\"]+)\"/)
        end
        
        def first_image_url
          image_urls.first.first
        end
end
