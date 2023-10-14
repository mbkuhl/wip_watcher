require 'rails_helper'

RSpec.describe "Projects Update", type: :feature do

  # User Story 14, Child Update 

  # As a visitor
  # When I visit a Child Show page
  # Then I see a link to update that Child "Update Child"
  # When I click the link
  # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
  # When I click the button to submit the form "Update Child"
  # Then a `PATCH` request is sent to '/child_table_name/:id',
  # the child's data is updated,
  # and I am redirected to the Child Show page where I see the Child's updated information

  before(:each) do
    @hobbyist1 = Hobbyist.create!(name: "Mike", weekly_free_hours: 10, disposible_income: 1000, has_kids: false)
    @project1 = @hobbyist1.projects.create!(project_name: "Build Shelves", required_time: 10, current_completion: 60, start_cost: 40, cost_rate: 0)
    @hobbyist2 = Hobbyist.create!(name: "Bob", weekly_free_hours: 12, disposible_income: 10000, has_kids: true)
    @project2 = @hobbyist2.projects.create!(project_name: "Crochet Scarf", required_time: 40, current_completion: 60, start_cost: 40, cost_rate: 1)
    @project3 = @hobbyist2.projects.create!(project_name: "Replace Exterior Door", required_time: 20, current_completion: 10, start_cost: 700, cost_rate: 10)
    @hobbyist3 = Hobbyist.create!(name: "Joe", weekly_free_hours: 5, disposible_income: 100000, has_kids: false)
    @project4 = @hobbyist3.projects.create!(project_name: "Sew Halloween Costume", required_time: 60, current_completion: 70, start_cost: 150, cost_rate: 3)
  end
  
  describe "As a visitor, when I visit a project show page" do
    describe "Then I see a link to update the projects 'Update Project'" do
      it "When I click the link, I am taken to /projects/:id/update" do
        visit "/projects/#{@project1.id}"
        expect(page).to have_link("Update Project", href: "/projects/#{@project1.id}/update")
        click_link "Update Project"
        expect(current_path).to eq("/projects/#{@project1.id}/update")
      end
    end

    describe "At /projects/:id/update, I see a form to edit the parent's attriutes" do
      describe "When I fill out the form with new information and click submit, then a PATCH request is sent to '/projects/:id'" do
        it 'The projects info is updated and I am redirected to the projects show page where that updated information is shown' do
          visit "/projects/#{@project1.id}/update"
          id = @project1.id
          fill_in('Project Name', with: 'Play BG3')
          fill_in('Required Time', with: '200')
          fill_in('Current Completion', with: '15')
          fill_in('Start Cost', with: '80')
          fill_in('Cost Rate', with: '0')          
          fill_in('Active', with: 'false')          
          fill_in('Completed', with: 'false')          
          fill_in('Abandoned', with: 'true')          
          click_button('Update Project')

          expect(Project.find(id).project_name).to eq("Play BG3")
          expect(current_path).to eq("/projects/#{@project1.id}")
          expect(page).to have_content("Required Time: 200 hours")
          expect(page).to have_content("Current Completion: 15%")
          expect(page).to have_content("Start Cost: $80")
          expect(page).to have_content("Cost Rate: $0/10hrs")
          expect(page).to have_content("Active: false")
          expect(page).to have_content("Complete: false")
          expect(page).to have_content("Abandoned: true")
        end         
      end      
    end
  end
end