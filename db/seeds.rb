# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.create(username: 'loubot', hashed_password: 'pass', first_name: 'Louis', last_name: 'Angelini', email:'lllouis@yahoo.com', display_name:'loubot', user_level: 9)
# Post.create(author_id: 1, body: 'This post was seeded into the database.', content:'Random stuff', title: 'Test post')

Category.create(name: 'Gardening', short_name: 'gard', description:'Posts about gardening')
Category.create(name: 'Music', short_name: 'mus', description:'Posts about Music')
Category.create(name: 'Family life', short_name: 'fam', description:'Posts about family life')