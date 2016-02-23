class Exercise < ActiveRecord::Base
	belongs_to :workout
	# mount_uploader :video, VideoUploader  
end


