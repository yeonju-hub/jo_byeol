class Activity < ApplicationRecord
  belongs_to :team
  belongs_to :user
	
	mount_uploader :attachment, AttachmentUploader 
end
