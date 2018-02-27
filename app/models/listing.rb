class Listing < ApplicationRecord
	include PgSearch
  pg_search_scope :search_by_title, :against => [:title, :description, :city]

  belongs_to :user
	paginates_per 9
  has_many :reservations
	mount_uploaders :image, ModelUploader

  scope :city, -> (city) { where city: city }



  def self.amenities(amenities, listings)
    x = listings.select do |listing|
      (listing.amenities & amenities) == amenities 
    end
    x = Listing.where(id: x.map(&:id))
  end  



  def self.date(date_span, listings)
    x = listings.select do |listing| 
     (listing.used_date & date_span).count == 0
    end
    x = Listing.where(id: x.map(&:id))
  end


end
