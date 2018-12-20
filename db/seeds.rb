# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create(name: 'John Doe', email: 'john.doe@example.net', password: '123123123')
user_2 = User.create(name: 'Jane Doe', email: 'jane.doe@example.net', password: '123123123')

goal_1 = user_1.goals.create(name: 'Savings', goal_value: 10000, unit_of_measure: '$')
goal_2 = user_1.goals.create(name: 'Weekly Run', goal_value: 30, unit_of_measure: 'km')
goal_3 = user_2.goals.create(name: 'Savings', goal_value: 30000, unit_of_measure: '$')

(1..120).step(10) do |i|
  goal_1.items.create(item_value: rand(10..300), created_at: i.days.ago)
end

(1..60).step(1) do |i|
  goal_2.items.create(item_value: rand(0..5), created_at: i.days.ago)
end

(1..120).step(10) do |i|
  goal_3.items.create(item_value: rand(10..300), created_at: i.days.ago)
end
