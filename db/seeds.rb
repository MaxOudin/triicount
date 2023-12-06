# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

max = User.new(
  email: "maxime@mail.com",
  password: "azeaze",
  first_name: "Maxime",
  last_name: "Mariano"
)

max.save

puts "user created"

Expense.destroy_all
Participant.destroy_all
Tricount.destroy_all

puts "Everything destroyed"

tricount = Tricount.new(
  title: "Trip to the moon",
  description: "We are going to the moon",
  user: max)

tricount.save

puts "Tricount created"

participant = Participant.new(
  names: ["Maxime", "Johnny", "Lucien", "Capucine"],
  tricount: tricount)
  
participant.save

puts "Participant created"

expense = Expense.new(
  title: "Space ship",
  description: "We need a space ship to go to the moon",
  amount_cents: 10000,
  payer: "Maxime",
  tricount: tricount,
  debtors: ["Maxime", "Johnny", "Lucien", "Capucine"])

expense.save

puts "Expense created"

puts "Everything is created"
