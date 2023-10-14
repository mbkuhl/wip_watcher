require 'rails_helper'

RSpec.describe "Hobbyists Show", type: :feature do

  before(:each) do
    @hobbyist1 = Hobbyist.create!(name: "Mike", weekly_free_hours: 10, disposible_income: 1000, has_kids: false)
    @project1 = @hobbyist1.projects.create!(project_name: "Build Shelves", required_time: 10, current_completion: 60, start_cost: 40, cost_rate: 0)
    @hobbyist2 = Hobbyist.create!(name: "Bob", weekly_free_hours: 12, disposible_income: 10000, has_kids: true)
    @project2 = @hobbyist2.projects.create!(project_name: "Crochet Scarf", required_time: 40, current_completion: 60, start_cost: 40, cost_rate: 1)
    @project3 = @hobbyist2.projects.create!(project_name: "Replace Exterior Door", required_time: 20, current_completion: 10, start_cost: 700, cost_rate: 10)
    @hobbyist3 = Hobbyist.create!(name: "Joe", weekly_free_hours: 5, disposible_income: 100000, has_kids: false)
    @project4 = @hobbyist3.projects.create!(project_name: "Sew Halloween Costume", required_time: 60, current_completion: 70, start_cost: 150, cost_rate: 3)
  end
  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes
  # (data from each column that is on the child table)

  describe "As a user" do
    describe "when I visit '/hobbyists/:id/projects'" do
      it "Then I see each project that is associated with that hobbyist with each project's attributes" do

        visit "/hobbyists/#{@hobbyist2.id}/projects"

        expect(page).to have_content(@hobbyist2.name)
        projects = @hobbyist2.projects
        projects.each do |project|
          expect(page).to have_content(project.project_name)
          expect(page).to have_content(project.required_time)
          expect(page).to have_content(project.current_completion)
          expect(page).to have_content(project.start_cost)
          expect(page).to have_content(project.cost_rate)
          expect(page).to have_content(project.active)
          expect(page).to have_content(project.completed)
          expect(page).to have_content(project.abandoned)
        end
      end
      # User Story 16, Sort Parent's Children in Alphabetical Order by name 
      
      # As a visitor
      # When I visit the Parent's children Index Page
      # Then I see a link to sort children in alphabetical order
      # When I click on the link
      # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
      
      describe "The I see a ling to sotr project in alphebetical order" do
        it "When I click on the link, I'm taken back to the Parent's children Index Page where I see all of the hobbyists projects in alphebetical order" do
          project5 = @hobbyist2.projects.create!(project_name: "Make Ramen", required_time: 24, current_completion: 50, start_cost: 50, cost_rate: 0)
          project6 = @hobbyist2.projects.create!(project_name: "Learn Coding", required_time: 1000, current_completion: 25, start_cost: 25000, cost_rate: 0)
          visit "/hobbyists/#{@hobbyist2.id}/projects"
          expect("Crochet Scarf").to appear_before("Replace Exterior Door")
          expect("Replace Exterior Door").to appear_before("Make Ramen")
          expect("Make Ramen").to appear_before("Learn Coding")
          expect(page).to have_link("Sort Alphebetical", href: "/hobbyists/#{@hobbyist2.id}/projects")
          expect(current_path).to eq("/hobbyists/#{@hobbyist2.id}/projects")
          expect("Crochet Scarf").to appear_before("Learn Coding")
          expect("Learn Coding").to appear_before("Make Ramen")
          expect("Make Ramen").to appear_before("Replace Exterior Door")
        end
      end
    end
  end
end