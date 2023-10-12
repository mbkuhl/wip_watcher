# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
hobbyist1 = Hobbyist.create!(name: "Mike", weekly_free_hours: 10, disposible_income: 1000, has_kids: false)
project1 = hobbyist1.projects.create!(project_name: "Build Shelves", required_time: 10, current_completion: 60, start_cost: 40, cost_rate: 0)
hobbyist2 = Hobbyist.create!(name: "Bob", weekly_free_hours: 12, disposible_income: 10000, has_kids: true)
project2 = hobbyist2.projects.create!(project_name: "Crochet Scarf", required_time: 40, current_completion: 60, start_cost: 40, cost_rate: 1)
project3 = hobbyist2.projects.create!(project_name: "Replace Exterior Door", required_time: 20, current_completion: 10, start_cost: 700, cost_rate: 10)
hobbyist3 = Hobbyist.create!(name: "Joe", weekly_free_hours: 5, disposible_income: 100000, has_kids: false)
project4 = hobbyist3.projects.create!(project_name: "Sew Halloween Costume", required_time: 60, current_completion: 70, start_cost: 150, cost_rate: 3)