require 'rails_helper'

RSpec.describe "Hobbyists New", type: :feature do

  before(:each) do
    @hobbyist1 = Hobbyist.create!(name: "Mike", weekly_free_hours: 10, disposible_income: 1000, has_kids: false)
    @project1 = @hobbyist1.projects.create!(project_name: "Build Shelves", required_time: 10, current_completion: 60, start_cost: 40, cost_rate: 0)
    @hobbyist2 = Hobbyist.create!(name: "Bob", weekly_free_hours: 12, disposible_income: 10000, has_kids: true)
    @project2 = @hobbyist2.projects.create!(project_name: "Crochet Scarf", required_time: 40, current_completion: 60, start_cost: 40, cost_rate: 1)
    @project3 = @hobbyist2.projects.create!(project_name: "Replace Exterior Door", required_time: 20, current_completion: 10, start_cost: 700, cost_rate: 10)
    @hobbyist3 = Hobbyist.create!(name: "Joe", weekly_free_hours: 5, disposible_income: 100000, has_kids: false)
    @project4 = @hobbyist3.projects.create!(project_name: "Sew Halloween Costume", required_time: 60, current_completion: 70, start_cost: 150, cost_rate: 3)
  end

#   User Story 11, Parent Creation 

# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

  describe "As a visitor, when I visit the hobbyists index page" do
    describe "Then I see a link to create a new hobbyist record" do
      it "When I click this link, I am taken to '/hobbyists/new" do
        visit '/hobbyists'
        expect(page).to have_link("New Hobbyist", href: '/hobbyists/new')
        click_link "New Hobbyist"
        expect(current_path).to eq("/hobbyists/new")
      end

      describe "At '/hobbyist/new I see a form for a new hobbyist" do
        it "Filling it out and clicking 'Create Hobbyist' will submit the form as a POST request to /hobbyists and redirect to the Hobbyist index page" do
          visit "/hobbyists/new"
          
          fill_in('Name', with: 'Jimmy')
          fill_in('Weekly Free Hours', with: '40')
          fill_in('Disposible Income', with: '500')
          fill_in('Has Kids', with: 'No')
          click_button('Create Hobbyist')

          expect(Hobbyist.last.name).to eq("Jimmy")
          expect(current_path).to eq("/hobbyists")
          save_and_open_page
          expect(page).to have_content("Jimmy")

        end
      end
    end
  end
end