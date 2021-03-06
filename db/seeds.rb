# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Post.destroy_all
Comment.destroy_all

users = []
50.times do
  users << User.create({
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password"
    })
end

posts = []
100.times do
  posts << Post.create({
    title: Faker::Lorem.sentence(3),
    content: Faker::Lorem.paragraph,
    author: users.sample
    })
end

100.times do
  Comment.create({
    content: Faker::Lorem.sentence,
    author: users.sample,
    post: posts.sample
    })
end