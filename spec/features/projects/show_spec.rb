require 'rails_helper'

RSpec.describe "Projects Show", type: :feature do
  # As a visitor
  # When I visit '/child_table_name/:id'
  # Then I see the child with that id including the child's attributes
  # (data from each column that is on the child table)

    describe "As a user" do
      describe "when I visit '/projects/:id'" do
        it "Then I see the child with that id including the child's attributes" do
          #arrange
          hobbyist1 = Hobbyist.create!(name: "Mike", weekly_free_hours: 10, disposible_income: 1000, has_kids: false)
          project1 = hobbyist1.projects.create!(project_name: "Build Shelves", required_time: 10, current_completion: 60, start_cost: 40, cost_rate: 0)
          hobbyist2 = Hobbyist.create!(name: "Bob", weekly_free_hours: 12, disposible_income: 10000, has_kids: true)
          project2 = hobbyist2.projects.create!(project_name: "Crochet Scarf", required_time: 40, current_completion: 60, start_cost: 40, cost_rate: 1)
          project3 = hobbyist2.projects.create!(project_name: "Replace Exterior Door", required_time: 20, current_completion: 10, start_cost: 700, cost_rate: 10)
          hobbyist3 = Hobbyist.create!(name: "Joe", weekly_free_hours: 5, disposible_income: 100000, has_kids: false)
          project4 = hobbyist3.projects.create!(project_name: "Sew Halloween Costume", required_time: 60, current_completion: 70, start_cost: 150, cost_rate: 3)
          #act
          visit "/projects/#{project1[:id]}"
          
          #assert
          expect(page).to have_content(project1.project_name)
          expect(page).to have_content(project1.required_time)
          expect(page).to have_content(project1.current_completion)
          expect(page).to have_content(project1.start_cost)
          expect(page).to have_content(project1.cost_rate)
          expect(page).to have_content(project1.completed)
          expect(page).to have_content(project1.abandoned)

        end
      end
    end
  end