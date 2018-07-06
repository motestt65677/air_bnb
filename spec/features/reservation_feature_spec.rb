require 'rails_helper'
RSpec.describe "reservation process", :type => :feature do

    let(:user){
      User.create({remember_token: "asdfasdf", email:"asdf@gmail.com", password:"asdfasdf"})
    }

  let(:listing){
    Listing.create({title:"sample listing", price: 100, user_id: user.id})
  }

  let(:reservation){
    Reservation.create({start_date: Date.today, end_date: Date.tomorrow, price: 100, listing_id: listing.id, user_id: user.id})
  }

  # let(:reservation2){
  #   Reservation.new({start_date: Date.tomorrow, end_date: Date.today, price: 100, listing_id: listing.id, user_id: user.id})
  # }

  # let(:reservation3){
  #   Reservation.new({start_date: Date.today, end_date: Date.tomorrow, price: 100, listing_id: listing.id, user_id: user.id})
  # }


  describe "get #new" do

    it "load reservation new page and create reservation, redirect to the payment path" do
      visit new_listing_reservation_path(listing, as: user)
      fill_in "reservation[start_date]", :with => "#{Date.today} to #{Date.tomorrow}"
      find('input[name="commit"]').click
    end
  end

  describe "get#itinery" do
    before do 
      visit new_listing_reservation_path(listing, as: user)
      fill_in "reservation[start_date]", :with => "#{Date.today} to #{Date.tomorrow}"
      find('input[name="commit"]').click
    end

    it "visit itinery page with current user and expect to see the reservation" do
      visit itinerary_path
      expect(page).to have_content 'Trips'
    end
    it "visit itinery page to see own reservation" do
      visit itinerary_path
      expect(page).to have_content 'sample listing'
    end
    it "visit reservation show page " do
      visit listing_reservation_path(listing, reservation, as:user)
      expect(page).to have_content 'sample listing'
    end
  end
end