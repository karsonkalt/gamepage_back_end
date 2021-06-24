# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Make Users
puts "Making users"
puts ""
rand(80..100).times do
    User.create(username: Faker::Internet.username)
    print "."
end
puts ""

# Make Scores
puts "Making scores"
puts ""

User.all.each do |user|
    # Make 1/10 users a power user
    if rand(1..10) == 1
        rand(10..15).times do
            Score.create(user: user, points: rand(30..60))
            print "."
        end
    else
        rand(1..4).times do
            Score.create(user: user, points: rand(15..50))
            print "."
        end
    end
end