20.times do |n|
  Event.create!(name: "Example Events #{n+1}",
  				description: Faker::Lorem.paragraph,
  				start_date: Time.now,
  				end_date: Time.now + 1,
  				picture: Faker::Avatar.image)
end