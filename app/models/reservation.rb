class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  before_save :calculate_reservation_price

  def calculate_day_span
    if self.start_date < self.end_date
      date_span = (self.start_date..self.end_date).count
      date_span = date_span - 1
    elsif self.start_date > self.end_date
      raise 'error'
    end
  end

  def update_used_date
    (self.start_date..self.end_date).each do |date|
      self.listing.used_date << date
    end
    self.listing.save  
  end

  def calculate_reservation_price
    date_span = self.calculate_day_span
    reservation_price = date_span * self.listing.price
    self.price = reservation_price
  end
end
