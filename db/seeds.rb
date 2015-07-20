# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'demo@demo.me', password: 'demopass')

Comment.create([
                   { author: 'Alex', comment: 'Yay! It works!' },
                   { author: 'Guest', comment: 'True! Isomorphic awesomeness!' }
              ])
