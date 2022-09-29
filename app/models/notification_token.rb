class NotificationToken < ApplicationRecord
	enum device_class: {"central_device":1,
		                "citizen_device":2
		               } 
end
