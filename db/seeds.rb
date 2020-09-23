# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'bcrypt'




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

past_hikes_img_urls = [
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQai1zzWNJqyPIEf9L4_4badHVwpjYQvfMyBkYpgUc6SBTEXId8&usqp=CAU',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRmmui3oOTp_RkY9R1tYbQo_wWPrrWRXZXljUNzRutTjZsEedio&usqp=CAU',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRXREQgtfaeYh7iWs8mX9_nNDgrJS86VjzfsVvhz0ten02zcDLg&usqp=CAU',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRCdrw9FDMMsEW0Q1K2PH7zlbBKlNbWRUbq8iNnvhUFPuY_e_X3&usqp=CAU',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTyOK9Urb8lNE13CG70hhLeWW3pcwSUIE4FHjsCpJJxx8zEMoJp&usqp=CAU'
]
future_hikes_img_urls = [
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRMfAz-BYBHKMqRDkwGNXCvJdjMcvY5EcwmOkDmZEIGnvxP3IgO&usqp=CAU',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR39EIjrProQ7UkcSczfiROy4kMwAzZQ-S_ogvzhkdK01yd1mHG&usqp=CAU',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQSm9PNsGetxBSw0-j9-rBqecYIRcMEXLTRLHaK-56CcveYTMWN&usqp=CAU',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR43pUQvaxOUhVb4jsUWK0h5u96acEjsXfKgB7SXjSSZeehpO4M&usqp=CAU',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSt5Q8eHRnYqkJ8rgITT5F-BbziQUNKgRbBgqEqrHEDFvk9_nri&usqp=CAU',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRR_bfl-VUHgrJ7wLo2N7a609zgj6LSi3DUN5ObD-fuOi5NKdnL&usqp=CAU',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSk5AgkplKk4THpj3jRVXNIsiqfW1JZANro_9pWxWpdqa55C2lm&usqp=CAU',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTgILo8Mmone2E6SoyFkQT6QzkVZDL5HWin-d7MyypQoX3RYT-1&usqp=CAU',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQv5jWdKcPnMm1ZqYMgSi_26xVda_6ULcfjxxrikW1o6IDmtL6I&usqp=CAU',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT0MNxghKoOkAZJTTQ4kCBYfiSKUJZN5gDxn3twXK8pYeHxfnyf&usqp=CAU',
]



member_img_urls.each {|url| Member.create(name: Faker::Name.name, username: Faker::Internet.username, password_digest: BCrypt::Password.create('Wc6AmSe30O'), email: Faker::Internet.email, img_url: url)}

future_hikes_img_urls.each{|url| Hike.create(location: Faker::Address.state, start_at: Faker::Time.forward(days: 200), distance: generate_dist_under_10(), duration: generate_dur_under_6(), description: Faker::Lorem.paragraph(sentence_count: rand(6..10)), host_id: Member.all.sample.id, img_url: url)}

past_hikes_img_urls.each{|url| Hike.create(location: Faker::Address.state, start_at: Faker::Time.backward(days: 200), distance: generate_dist_under_10(), duration: generate_dur_under_6(), description: Faker::Lorem.paragraph(sentence_count: rand(6..10)), host_id: Member.all.sample.id, img_url: url)}

15.times {Participation.create(member_id: Member.all.sample.id, hike_id: Hike.all.sample.id)}

20.times {Comment.create(content: Faker::Lorem.sentence(word_count: rand(10..20)), member_id: Member.all.sample.id, hike_id: Hike.all.sample.id)}