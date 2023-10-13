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
#   As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)

  describe "As a user" do
    describe "when I visit '/hobbyists/:id'" do
      it "I see the name of the hobbyist with that id plus it's attributes" do
        visit "/hobbyists/#{@hobbyist1.id}"

        expect(page).to have_content(@hobbyist1.name)
        expect(page).to have_content(@hobbyist1.actual_free_hours)
        expect(page).to have_content(@hobbyist1.disposible_income)
      end
    end
  end


#   User Story 7, Parent Child Count

# As a visitor
# When I visit a parent's show page
# I see a count of the number of children associated with this parent

  describe "As a user" do
    describe "When I visit a parent's show page" do
      it "I see a count of the number of children associated with this parent" do
        visit "/hobbyists/#{@hobbyist1.id}"

        expect(page).to have_content("Number of hobbies: #{@hobbyist1.projects.count}")

        visit "/hobbyists/#{@hobbyist2.id}"

        expect(page).to have_content("Number of hobbies: #{@hobbyist2.projects.count}")
      end
    end
  end

#   User Story 10, Parent Child Index Link

# As a visitor
# When I visit a parent show page ('/parents/:id')
# Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')

  describe "As a visitor" do
    describe "When I visit a hobbyist show page ('hobbyist/:id')" do
      it "Then I see a link to take me to that hobbysist's project page ('/hobbyists/:id/projects)" do
        visit "/hobbyists/#{@hobbyist2.id}"
        expect(page).to have_link(href: "/hobbyists/#{@hobbyist2.id}/projects")
        click_link "Bob's Projects"
        expect(page).to have_current_path("/hobbyists/#{@hobbyist2.id}/projects")
      end
    end
  end

end