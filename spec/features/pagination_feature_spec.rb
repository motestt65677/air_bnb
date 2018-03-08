require 'rails_helper'
RSpec.describe "pagination user feature", :type => :feature do


  let(:user){
    User.create({remember_token: "asdfasdf", email:"asdf@gmail.com", password:"asdfasdf"})
  }

  let(:listing8){
    Listing.create({title:"sample listing8", price: 100, user_id: user.id})
  }

  describe "It should display the correct number of pages." do 
    before do
      10.times do |time|
        Listing.create({title:"sample listing8", price: 100, user_id: user.id})
      end
      Listing.create({title:"page 2 listing", price: 100, user_id: user.id})
      visit listings_path(as: user)
    end
    
    it "should have tyokyo on the listings page" do
      
      expect(page).to have_content 'Amenities'
    end

    it "should have listing 8 " do
      expect(page).to have_content("sample listing8", count:9)
    end

    it "should page number 1 and 2 " do
      expect(page).to have_content '1'
      expect(page).to have_content '2'
    end

    it "should find user is on page 1" do
      expect(page.find('//span[@class="page current"]'))
    end


    it "should find the second page is a clickable link to page 2" do
      expect(page.find('//span[@class="page"]').text).to eq("2")
    end
    
    it "should find the 'next', 'prev', 'last' and not find the 'first' link" do
      expect(page.find('//span[@class="next"]'))
      expect{page.find('//span[@class="prev"]')}.to raise_error
      expect(page.find('//span[@class="last"]'))
      expect{page.find('//span[@class="first"]')}.to raise_error

    end

    it "the user should be on the second page" do
      find_link('2').click
      expect(page).to have_content "page 2 listing"
    end

    it "when the user is on the second page, user should see 'prev', 'first', but not 'last', 'next' button" do
      find_link('2').click
      expect{page.find('//span[@class="last"]')}.to raise_error
      expect{page.find('//span[@class="next"]')}.to raise_error
      expect(page.find('//span[@class="prev"]'))
      expect(page.find('//span[@class="first"]'))
    end

  end

end