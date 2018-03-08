require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do

  
  let(:user){
    User.create({remember_token: "asdfasdf", email:"asdf@gmail.com", password:"asdfasdf"})
  }

  let(:listing){
    Listing.create({price: 100, user_id: user.id})
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
      it "should load successfully" do
        get :new, params: {:listing_id => listing.id}
        expect(response).to have_http_status(:success)
      end
  end


  describe "get #create" do
    before do 
      sign_in_as(user)
      post :create, params:{
        :listing_id => listing.id, 
        :reservation => {start_date: "#{Date.today} to #{Date.tomorrow}"}
      }
    end
    it "should load successfully" do
      expect{
        post :create, params:{
          :listing_id => listing.id, 
          :reservation => {start_date: "#{Date.today} to #{Date.tomorrow}"}
        }

      }.to change(Reservation, :count).by(1)
    end

    #unhappy routes
    it "should raise an error when start_date is not provided" do
      expect{
        post :create
        }.to raise_error     
    end


  end

  describe "get #show" do
    it "should load successfully" do
      get :show, params: {listing_id: listing.id, id: reservation.id}
      expect(response).to have_http_status(:success)
    end
  end





end
