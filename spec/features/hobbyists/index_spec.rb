require 'rails_helper'

RSpec.describe "Hobbyists Index", type: :feature do
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
    describe "As a user" do
      describe "when I visit '/hobbyists'" do
        it "I see the name of each hobbyist" do
          #arrange
          hobbyist1 = Hobbyist.create!(name: "Mike", weekly_free_hours: 10, disposible_income: 1000, has_kids: false)
          hobbyist2 = Hobbyist.create!(name: "Bob", weekly_free_hours: 12, disposible_income: 10000, has_kids: true)
          hobbyist3 = Hobbyist.create!(name: "Joe", weekly_free_hours: 5, disposible_income: 100000, has_kids: false)
  
          #act
          visit "/hobbyists"
  
          #assert
          expect(page).to have_content(hobbyist1.name)
          expect(page).to have_content(hobbyist2.name)
          expect(page).to have_content(hobbyist3.name)
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
      #arrange
      hobbyist1 = Hobbyist.create!(name: "Mike", weekly_free_hours: 10, disposible_income: 1000, has_kids: false)
      hobbyist2 = Hobbyist.create!(name: "Bob", weekly_free_hours: 12, disposible_income: 10000, has_kids: true)
      hobbyist3 = Hobbyist.create!(name: "Joe", weekly_free_hours: 5, disposible_income: 100000, has_kids: false)

      #act
      visit "/hobbyists"

      #assert
      expect(page).to have_content(hobbyist1.created_at)
      expect(page).to have_content(hobbyist2.created_at)
      expect(page).to have_content(hobbyist3.created_at)
      expect(hobbyist3.name).to appear_before(hobbyist2.name)
      expect(hobbyist2.name).to appear_before(hobbyist1.name)
    end
  end
end
end