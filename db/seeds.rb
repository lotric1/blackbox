# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bbox1 = Bbox.create(title: "College", position: 1, items_per_day: 3, starred: true, user_id: 1)
bbox2 = Bbox.create(title: "Personal", position: 2, items_per_day: 3, starred: false, user_id: 1)