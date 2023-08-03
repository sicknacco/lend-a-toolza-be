# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Tool.destroy_all

tool1 = Tool.create!(name: "Hammer", description: "Smashem", image: "image.jpg", status: "available", user_id: 2, address: "123 Sunnyside Dr, Lebanon, IN, 46052", borrower_id: nil)
tool2 = Tool.create!(name: "Saw", description: "Cutem", image: "image.jpg", status: "available", user_id: 2, address: "123 Sunnyside Dr, Lebanon, IN, 46052", borrower_id: nil)
tool3 = Tool.create!(name: "Drill", description: "Drillem", image: "image.jpg", status: "available", user_id: 4, address: "1234 Sunnyside Dr, Lebanon, IN, 46052", borrower_id: 2)
tool4 = Tool.create!(name: "Screwdriver", description: "Screwem", image: "image.jpg", status: "available", user_id: 7, address: "1237 Sunnyside Dr, Lebanon, IN, 46052", borrower_id: 2)
