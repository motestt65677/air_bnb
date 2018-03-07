require 'rails_helper'
RSpec.describe Reservation, type: :model do
  
  it { should validate_presence_of(:price) }

  
  # let(:user){
  #   User.create({remember_token: "asdfasdf", email:"asdf@gmail.com", password:"asdfasdf"})
  # }

  # let(:listing){
  #   Listing.create({price: 100, user_id: user.id})
  # }

  # let(:reservation){
  #   Reservation.create({start_date: Date.today, end_date: Date.tomorrow, price: 100, listing_id: listing.id, user_id: user.id})
  # }

  # let(:reservation2){
  #   Reservation.new({start_date: Date.tomorrow, end_date: Date.today, price: 100, listing_id: listing.id, user_id: user.id})
  # }

  # let(:reservation3){
  #   Reservation.new({start_date: Date.today, end_date: Date.tomorrow, price: 100, listing_id: listing.id, user_id: user.id})
  # }




  # describe "reservation#calculate_day_span" do
  #   context "calculate the number of days, from start_date to end_date" do
  #     it "should be the difference between start date and end date" do
  #       expect(reservation.calculate_day_span).to eq(1)
  #     end
  #   end
  #   context "attempting to save invalid start date and end date " do
  #     it "should add an eror when start date is after end date_" do
  #       expect{reservation2.save}.to raise_error
  #     end
  #   end
  # end

  # describe "reservation#calculate_reservation_price" do
  #   context "calculae the price of resrvation" do
  #         it "should return valid price given valid input" do
  #       expect(reservation.calculate_reservation_price).to equal(reservation.calculate_day_span*reservation.price)
  #     end
  #   end
  # end

  # describe "reservation#update_used_date" do
  #   context "update used calendar date after a reservation is done"do
      
  #     When {reservation.update_used_date}
  #     it do "should return proper used date in an array"
  #       expect(reservation.listing.used_date).to eq([Date.today.to_s, Date.tomorrow.to_s])
  #     end
  #   end
  # end


end