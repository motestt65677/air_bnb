# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# cities = %w(Kabul London Taipei Kuala Lumpur Canberra Beijing Berlin Moscow Seoul Pyongyang Manila Cape_Town Rome Tokyo)
# listings = Listing.all

# listings.each do |listing|
#   listing.update_attribute(:city, cities.sample )
# end

# user = {}
# user[:password] = "jlksdf"
# emails = ["sssr@example.com", "eeer@example.com", "sssr@example.com"]

# ActiveRecord::Base.transaction do
#     3.times do |i| 
#         user[:email] = emails[i]
#         User.create!(user)
#     end
#     # user1 = User.create(email: 'sss@example.com')
#     # user2 = User.create(email: 'eeef@example.com')
#     # user3 = User.create(email: 'sss@example.com')

#     # p user1.errors.full_messages
#     # p user2.errors.full_messages
#     # p user3.errors.full_messages
# end




# user = {}
# user['password'] = 'asdf'
# user['confirmation_token'] = 'asdf'

# ActiveRecord::Base.transaction do
#   20.times do 
#     user['first_name'] = Faker::Name.first_name 
#     user['last_name'] = Faker::Name.last_name
#     user['email'] = Faker::Internet.email
#     user['gender'] = rand(1..2)
#     user['phone'] = Faker::PhoneNumber.phone_number
#     user['country'] = Faker::Address.country
#     user['birthdate'] = Faker::Date.between(50.years.ago, Date.today)

#     User.create(user)
#   end
# # end 
# listing = {}
# uids = []
# User.all.each { |u| uids << u.id }

# ActiveRecord::Base.transaction do
#   40.times do 
#     listing['title'] = Faker::App.name
#     listing['description'] = Faker::Hipster.sentence

#     listing['user_id'] = uids.sample

#     Listing.create(listing)
#   end
# end
