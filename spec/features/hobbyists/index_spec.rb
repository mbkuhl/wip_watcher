require 'rails_helper'

RSpec.describe "Hobbyists Index", type: :feature do

  before(:each) do
    @hobbyist1 = Hobbyist.create!(name: "Mike", weekly_free_hours: 10, disposible_income: 1000, has_kids: false)
    @project1 = @hobbyist1.projects.create!(project_name: "Build Shelves", required_time: 10, current_completion: 60, start_cost: 40, cost_rate: 0)
    @hobbyist2 = Hobbyist.create!(name: "Bob", weekly_free_hours: 12, disposible_income: 10000, has_kids: true)
    @project2 = @hobbyist2.projects.create!(project_name: "Crochet Scarf", required_time: 40, current_completion: 60, start_cost: 40, cost_rate: 1)
    @project3 = @hobbyist2.projects.create!(project_name: "Replace Exterior Door", required_time: 20, current_completion: 10, start_cost: 700, cost_rate: 10)
    @hobbyist3 = Hobbyist.create!(name: "Joe", weekly_free_hours: 5, disposible_income: 100000, has_kids: false)
    @project4 = @hobbyist3.projects.create!(project_name: "Sew Halloween Costume", required_time: 60, current_completion: 70, start_cost: 150, cost_rate: 3)
    @project5 = @hobbyist2.projects.create!(project_name: "Make Ramen", required_time: 24, current_completion: 50, start_cost: 50, cost_rate: 0)
    @project6 = @hobbyist3.projects.create!(project_name: "Learn Coding", required_time: 1000, current_completion: 51, start_cost: 25000, cost_rate: 0)

  end

  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
    describe "As a user" do
      describe "when I visit '/hobbyists'" do
        it "I see the name of each hobbyist" do
          #act
          visit "/hobbyists"
  
          #assert
          expect(page).to have_content(@hobbyist1.name)
          expect(page).to have_content(@hobbyist2.name)
          expect(page).to have_content(@hobbyist3.name)
        end
      end
    end

    # User Story 6, Parent Index sorted by Most Recently Created 

  # As a visitor
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created
  describe "As a visitor" do
    describe "when I visit '/hobbyists'" do
      it "I see that records are ordered by most recently created first, and next to each of the records I see when it was created" do
        visit "/hobbyists"

          #assert
          expect(page).to have_content(@hobbyist1.created_at)
          expect(page).to have_content(@hobbyist2.created_at)
          expect(page).to have_content(@hobbyist3.created_at)
          expect(@hobbyist3.name).to appear_before(@hobbyist2.name)
          expect(@hobbyist2.name).to appear_before(@hobbyist1.name)
        end
      end
    end

  # User Story 17, Parent Update From Parent Index Page 

  # As a visitor
  # When I visit the parent index page
  # Next to every parent, I see a link to edit that parent's info
  # When I click the link
  # I should be taken to that parent's edit page where I can update its information just like in User Story 12

  describe "As a visitor" do
    describe "when I visit '/hobbyists' next to every parent, I see a link to edit that parent's info" do
      it "When I click the link I should be taken to that hobbyists's edit page where I can update its information" do
        visit "/hobbyists"
        hobbyists = Hobbyist.all
        hobbyists.each do |hobbyist|
          expect(page).to have_link("Update #{hobbyist.name}", href: "/hobbyists/#{hobbyist.id}/update")
          click_link("Update #{hobbyist.name}")
          expect(current_path).to eq("/hobbyists/#{hobbyist.id}/update")
          visit "/hobbyists"
        end
      end
    end


    # User Story 22, Parent Delete From Parent Index Page 

    # As a visitor
    # When I visit the parent index page
    # Next to every parent, I see a link to delete that parent
    # When I click the link
    # I am returned to the Parent Index Page where I no longer see that parent

    describe "When I visit the hobbyist index page, next to every hobbyist, I see a link to delete that hobbyist" do
      it "When I click the link, I am returned to the hobbyist index where I no longer see that hobbyist" do
        visit "/hobbyists"
        expect(@hobbyist3.name).to appear_before("Delete #{@hobbyist3.name}")
        expect("Delete #{@hobbyist3.name}").to appear_before(@hobbyist2.name)
        expect(@hobbyist2.name).to appear_before("Delete #{@hobbyist2.name}")
        expect("Delete #{@hobbyist2.name}").to appear_before(@hobbyist1.name)
        expect(@hobbyist1.name).to appear_before("Delete #{@hobbyist1.name}")
        click_link("Delete #{@hobbyist1.name}")
        expect(page).to_not have_content(@hobbyist1.name)
        expect(current_path).to eq("/hobbyists")
        click_link("Delete #{@hobbyist3.name}")
        expect(page).to_not have_content(@hobbyist3.name)
        expect(current_path).to eq("/hobbyists")
        click_link("Delete #{@hobbyist2.name}")
        expect(page).to_not have_content(@hobbyist2.name)
        expect(current_path).to eq("/hobbyists")
      end
    end

# Extension 1: Sort Parents by Number of Children 

# As a visitor
# When I visit the Parents Index Page
# Then I see a link to sort parents by the number of `child_table_name` they have
# When I click on the link
# I'm taken back to the Parent Index Page where I see all of the parents in order of their count of `child_table_name` (highest to lowest) 
# And, I see the number of children next to each parent name

    describe "When I visit Hobbyists Index Page, Then I see a link to sort hobbyists by the number of project they have" do
      it "When I click the link, I'm returned to the same page, hobbyists are sorted descending by number of hobbies, also showing hobbies" do
        visit "/hobbyists"
        expect(page).to have_link("Sort by Number of Hobbies")
        click_link("Sort by Number of Hobbies")
        expect(current_path).to eq("/hobbyists")
        expect(@hobbyist2.name).to appear_before(@hobbyist3.name)
        expect(@hobbyist3.name).to appear_before(@hobbyist1.name)
        expect(@hobbyist2.name).to appear_before("Number of Hobbies: 3")
        expect("Number of Hobbies: 3").to appear_before(@hobbyist3.name)
        expect(@hobbyist3.name).to appear_before("Number of Hobbies: 2")
        expect("Number of Hobbies: 2").to appear_before(@hobbyist1.name)
        expect(@hobbyist1.name).to appear_before("Number of Hobbies: 1")
      end
    end
  end
end