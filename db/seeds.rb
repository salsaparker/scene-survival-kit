# User.destroy_all
# Profile.destroy_all

# User.create!(full_name: "Example Person",
# 						email: "giraffe@gmail.com",
# 						password: "password",
# 						password_confirmation: "password")
# Create test user accounts


    10.times do |n|
      fullname = Faker::Name.name
      email = Faker::Internet.email
      password = "password"
      User.create!(:full_name => fullname,
        :email => email,
        :password => password,
        :password_confirmation => password)


		users = User.all

      1.times do
				users.each do |user|
					name = Faker::Name.name
					bio = Faker::Lorem.sentence
					phone_number = Faker::PhoneNumber.phone_number
					image = Faker::Avatar.image
        Profile.create!(name: name,
          bio: bio,
					phone_number: phone_number,
					image: image, 
					user_id: user.id)
				end
      end
	end