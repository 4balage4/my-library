# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "destroying database...."
Comment.destroy_all
Listing.destroy_all
Book.destroy_all
List.destroy_all

puts "Creating books"
100.times do
  Book.create(title: Faker::Book.title, writer: Faker::Book.author, genree: Faker::Book.genre, user_id: 1)
end

puts "Creating lists"

List.create(name: "Biography", comment: "Inspiring peoples", user_id: 1)
List.create(name: "Finance", comment: "All about investment, money", user_id: 1)
List.create(name: "Business", comment: "", user_id: 1)
List.create(name: "Reading list", comment: "Reading list for the year 2023", user_id: 1)
List.create(name: "Next books to read", comment: "I can't wait to start reading these books", user_id: 1)
List.create(name: "Books for school" , comment: "Must read to finish the university", user_id: 1)
List.create(name: "Science", comment: "real science", user_id: 1)

book_ids = []
Book.all.each do |book|
   book_ids << book.id
end

list_ids = []
List.all.each do |list|
  list_ids << list.id
end

puts "adding books to lists"
100.times do
  Listing.create(book_id: book_ids.sample, list_id: list_ids.sample)
end
