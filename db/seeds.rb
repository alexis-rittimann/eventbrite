# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Faker::Config.locale = 'fr'

#User.destroy_all
Event.destroy_all
#10.times do
#  User.create!(email: Faker::Internet.email(domain: '@yopmail.com'))
#  puts "user a été crée"
#end

20.times do
  quote = Faker::TvShows::Simpsons.quote
  Event.create(
    start_date: Faker::Date.between(from: Date.today, to: 365.days.from_now),
    duration: rand(1..2016)*5, #durée au maximum de 7 jours
    title: quote[0..22],
    description: quote,
    price: rand(1..1000),
    location: Faker::TvShows::Simpsons.location,
    )
end
puts "Nombre d'Events créés : #{Event.count}/20"
