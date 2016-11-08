class Event < ActiveRecord::Base
	belongs_to :activity, polymorphic:true
end
