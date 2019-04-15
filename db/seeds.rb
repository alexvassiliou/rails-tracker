# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "clearing database"

Good.destroy_all

puts "adding goods to database"


counter = 0
100.times do
  Good.create!(
    name: Faker::Commerce.product_name,
    category: Faker::Commerce.department(1, true),
    source: Faker::Address.city,
    destination: Faker::Address.city,
    consignment: "AA00" + "#{counter += 1}",
    entry_at: Faker::Date.backward(5),
    exit_at: nil
    )
end
