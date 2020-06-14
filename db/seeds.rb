# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Member.delete_all
Hike.delete_all
Participation.delete_all
Comment.delete_all

img_urls = ['https://randomuser.me/api/portraits/women/29.jpg', 'https://randomuser.me/api/portraits/women/44.jpg', 'https://randomuser.me/api/portraits/women/37.jpg', 'https://randomuser.me/api/portraits/women/68.jpg', 'https://randomuser.me/api/portraits/women/89.jpg', 'https://randomuser.me/api/portraits/men/54.jpg', 'https://randomuser.me/api/portraits/men/91.jpg', 'https://randomuser.me/api/portraits/men/90.jpg', 'https://randomuser.me/api/portraits/men/58.jpg', 'https://randomuser.me/api/portraits/men/4.jpg']

img_urls.each {|url| Member.create(name: Faker::Name.name, username: Faker::Internet.username, email: Faker::Internet.email, img_url: url)}

10.times {Hike.create(location: Faker::Address.state, date: Faker::Date.in_date_period, time:)}
10.times {Hike.create(location: , date: Faker::Date.in_date_period(year: 2018))}