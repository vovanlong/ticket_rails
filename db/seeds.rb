
20.times do |n|
  Event.create!(name: "Example Events #{n+1}",
  				description: Faker::Lorem.paragraph,
  				start_date: Time.now,
  				end_date: Time.now + 1,
  				picture: Faker::Avatar.image,
  				user_id: 0)
end

# 20.times do |n|
#   User.create!(name: "User Name #{n+1}",
#   				email: "vovanlong#{n+1}@gmail.com",
#   				password_digest: "123123",
#   				age: 21,
#   				city: "da nang",
#   				address: "son tra",
#   				admin: 0)
# end
