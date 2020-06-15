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

def generate_random_time()
  hour = rand(24)
  minute = rand(60)
  new_hour = 0
  new_minute = 0
  if hour < 10
    new_hour = "0#{hour.to_s}"
  else 
    new_hour = hour.to_s
  end
  if minute < 10
    new_minute = "0#{minute.to_s}"
  else
    new_minute = minute.to_s
  end
  "#{new_hour}:#{new_minute}"
end

def generate_dist_under_10()
  (rand*10).round(1)
end

def generate_dur_under_6()
  (rand*6).round(1)
end

member_img_urls = ['https://randomuser.me/api/portraits/women/29.jpg', 'https://randomuser.me/api/portraits/women/44.jpg', 'https://randomuser.me/api/portraits/women/37.jpg', 'https://randomuser.me/api/portraits/women/68.jpg', 'https://randomuser.me/api/portraits/women/89.jpg', 'https://randomuser.me/api/portraits/men/54.jpg', 'https://randomuser.me/api/portraits/men/91.jpg', 'https://randomuser.me/api/portraits/men/90.jpg', 'https://randomuser.me/api/portraits/men/58.jpg', 'https://randomuser.me/api/portraits/men/4.jpg']


member_img_urls.each {|url| Member.create(name: Faker::Name.name, username: Faker::Internet.username, email: Faker::Internet.email, img_url: url)}

10.times {Hike.create(location: Faker::Address.state, start_at: Faker::Time.forward(days: 200), distance: generate_dist_under_10(), duration: generate_dur_under_6(), description: Faker::Lorem.paragraph(sentence_count: rand(6..10)), host_id: Member.all.sample.id)}

5.times {Hike.create(location: Faker::Address.state, start_at: Faker::Time.backward(days: 200), distance: generate_dist_under_10(), duration: generate_dur_under_6(), description: Faker::Lorem.paragraph(sentence_count: rand(6..10)), host_id: Member.all.sample.id)}

15.times {Participation.create(member_id: Member.all.sample.id, hike_id: Hike.all.sample.id)}

20.times {Comment.create(content: Faker::Lorem.sentence(word_count: rand(10..20)), member_id: Member.all.sample.id, hike_id: Hike.all.sample.id)}