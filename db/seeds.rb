# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

9.times do |user|
  User.create(name: Faker::Name.name)
end

9.times do
  Food.create(name: Faker::Food.fruits, measurement_unit: Faker::Food.metric_measurement, price: rand(1..27), quantity: rand(1..9), user_id: rand(1..9))
  Food.create(name: Faker::Food.ingredient, measurement_unit: Faker::Food.metric_measurement, price: rand(1..27), quantity: rand(1..9), user_id: rand(1..9))
  Food.create(name: Faker::Food.vegetables, measurement_unit: Faker::Food.metric_measurement, price: rand(1..27), quantity: rand(1..9), user_id: rand(1..9))
end
