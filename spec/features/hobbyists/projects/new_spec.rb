require 'rails_helper'

RSpec.describe "Project for Hobbyist New", type: :feature do

  before(:each) do
    @hobbyist1 = Hobbyist.create!(name: "Mike", weekly_free_hours: 10, disposible_income: 1000, has_kids: false)
    @project1 = @hobbyist1.projects.create!(project_name: "Build Shelves", required_time: 10, current_completion: 60, start_cost: 40, cost_rate: 0)
    @hobbyist2 = Hobbyist.create!(name: "Bob", weekly_free_hours: 12, disposible_income: 10000, has_kids: true)
    @project2 = @hobbyist2.projects.create!(project_name: "Crochet Scarf", required_time: 40, current_completion: 60, start_cost: 40, cost_rate: 1)
    @project3 = @hobbyist2.projects.create!(project_name: "Replace Exterior Door", required_time: 20, current_completion: 10, start_cost: 700, cost_rate: 10)
    @hobbyist3 = Hobbyist.create!(name: "Joe", weekly_free_hours: 5, disposible_income: 100000, has_kids: false)
    @project4 = @hobbyist3.projects.create!(project_name: "Sew Halloween Costume", required_time: 60, current_completion: 70, start_cost: 150, cost_rate: 3)
  end

  # User Story 13, Parent Child Creation 

  # As a visitor
  # When I visit a Parent Children Index page
  # Then I see a link to add a new adoptable child for that parent "Create Child"
  # When I click the link
  # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
  # When I fill in the form with the child's attributes:
  # And I click the button "Create Child"
  # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
  # a new child object/row is created for that parent,
  # and I am redirected to the Parent Childs Index page where I can see the new child listed
  
  describe "As a visitor, when I visit the hobbyists' projects index page" do
    describe "Then I see a link to create a new project record for that hobbyist" do
      it "When I click this link, I am taken to '/hobbyists/:id/projects/new'" do
        visit "/hobbyists/#{@hobbyist2.id}/projects"
        expect(page).to have_link("New Project", href: "/hobbyists/#{@hobbyist2.id}/projects/new")
        click_link "New Project"
        expect(current_path).to eq("/hobbyists/#{@hobbyist2.id}/projects/new")
      end

      describe "At '/hobbyists/:id/projects/new' I see a form for a new project" do
        it "Filling it out and clicking 'Create Project' will submit the form as a POST request to '/hobbyists/:id/projects/new' and redirect to the Hobbyists' Proect index page" do
          visit "/hobbyists/#{@hobbyist2.id}/projects/new"
          
          fill_in('Project Name', with: 'Play BG3')
          fill_in('Required Time', with: '200')
          fill_in('Current Completion', with: '15')
          fill_in('Start Cost', with: '80')
          fill_in('Cost Rate', with: '0')
          click_button('Create Project')

          expect(Project.last.project_name).to eq("Play BG3")
          expect(current_path).to eq("/hobbyists/#{@hobbyist2.id}/projects")
          expect(page).to have_content("Play BG3")

        end
      end
    end
  end
end