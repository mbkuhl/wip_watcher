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
      it "Then I see each Child that is associated with that Parent with each Child's attributes" do

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
    end
  end
end