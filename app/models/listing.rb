class Listing < ApplicationRecord
	belongs_to :user
	paginates_per 9
  has_many :reservations
	mount_uploaders :image, ModelUploader
end
