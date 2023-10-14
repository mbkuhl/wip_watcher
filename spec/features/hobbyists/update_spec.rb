require 'rails_helper'

RSpec.describe "Hobbyists Update", type: :feature do

  # User Story 12, Parent Update 
  
  # As a visitor
  # When I visit a parent show page
  # Then I see a link to update the parent "Update Parent"
  # When I click the link "Update Parent"
  # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
  # When I fill out the form with updated information
  # And I click the button to submit the form
  # Then a `PATCH` request is sent to '/parents/:id',
  # the parent's info is updated,
  # and I am redirected to the Parent's Show page where I see the parent's updated info

  before(:each) do
    @hobbyist1 = Hobbyist.create!(name: "Mike", weekly_free_hours: 10, disposible_income: 1000, has_kids: false)
    @project1 = @hobbyist1.projects.create!(project_name: "Build Shelves", required_time: 10, current_completion: 60, start_cost: 40, cost_rate: 0)
    @hobbyist2 = Hobbyist.create!(name: "Bob", weekly_free_hours: 12, disposible_income: 10000, has_kids: true)
    @project2 = @hobbyist2.projects.create!(project_name: "Crochet Scarf", required_time: 40, current_completion: 60, start_cost: 40, cost_rate: 1)
    @project3 = @hobbyist2.projects.create!(project_name: "Replace Exterior Door", required_time: 20, current_completion: 10, start_cost: 700, cost_rate: 10)
    @hobbyist3 = Hobbyist.create!(name: "Joe", weekly_free_hours: 5, disposible_income: 100000, has_kids: false)
    @project4 = @hobbyist3.projects.create!(project_name: "Sew Halloween Costume", required_time: 60, current_completion: 70, start_cost: 150, cost_rate: 3)
  end
  
  describe "As a visitor, when I visit a hobbyist show page" do
    describe "Then I see a link to update the hobbyist 'Update Hobbyist'" do
      it "When I click the link, I am taken to /hobbyists/:id/update" do
        visit "/hobbyists/#{@hobbyist1.id}"
        expect(page).to have_link("Update Hobbyist", href: "/hobbyists/#{@hobbyist1.id}/update")
        click_link "Update Hobbyist"
        expect(current_path).to eq("/hobbyists/#{@hobbyist1.id}/update")
      end
    end

    describe "At /hobbyists/:id/update, I see a form to edit the parent's attriutes" do
      describe "When I fill out the form with new information and click submit, then a PATCH request is sent to '/hobbyists/:id'" do
        it 'The hobbyists info is updated and I am redirected to the hobbyists show page where that updated information is shown' do
          visit "/hobbyists/#{@hobbyist1.id}/update"
          id = @hobbyist1.id
          fill_in('Name', with: 'eeeeeee')
          fill_in('Weekly Free Hours', with: '4')
          fill_in('Disposible Income', with: '50000')
          fill_in('Has Kids', with: 'true')
          
          click_button('Update Hobbyist')
          expect(Hobbyist.find(id).name).to eq("eeeeeee")
          expect(current_path).to eq("/hobbyists/#{@hobbyist1.id}")
          expect(page).to have_content("eeeeeee")
          expect(page).to have_content("Actual Free Hours: 1")
          expect(page).to have_content("Disposible Income: 50000")
        end         
      end      
    end
  end
end

