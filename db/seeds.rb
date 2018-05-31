# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Create users

10.times do
  u = User.create!(
    email:    Faker::Internet.email,
    password: Faker::Internet.password(8)
  )
  u.confirm
end
u = User.create!(email: "user1@gmail.com", password: "password" )
u.confirm
u = User.create!(email: "admin1@gmail.com", password: "password", role: "admin" )
u.confirm

users = User.all

# Create wikis

20.times do
  Wiki.create!(
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph,
    user:   users.sample
  )
end
