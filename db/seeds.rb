# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Lilly G.",
            email: "t@t.com",
            password:              "111111",
            password_confirmation: "111111")

#creating sample users with Faker gem
99.times do |n|
 name  = Faker::Name.name
 email = "example-#{n+1}@railstutorial.org"
 password = "password"
 User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password)
end

#creating sample posts with Faker gem
#users = User.order(:created_at).take(6)
#50.times do
#  title = Faker::Lorem.words(4)
 #text = Faker::Lorem.sentence(5)
 #users.each { |user| user.articles.create!(text: text) }
#end
