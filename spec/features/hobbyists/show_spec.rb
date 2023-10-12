require 'rails_helper'

RSpec.describe "Hobbyists Show", type: :feature do

#   As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)

  describe "As a user" do
    describe "when I visit '/hobbyists/:id'" do
      it "I see the name of the hobbyist with that id plus it's attributes" do
        hobbyist1 = Hobbyist.create!(name: "Mike", weekly_free_hours: 10, disposible_income: 1000, has_kids: false)
        hobbyist2 = Hobbyist.create!(name: "Bob", weekly_free_hours: 12, disposible_income: 10000, has_kids: true)
        hobbyist3 = Hobbyist.create!(name: "Joe", weekly_free_hours: 5, disposible_income: 100000, has_kids: false)

        visit "/hobbyists/#{hobbyist1.id}"

        expect(page).to have_content(hobbyist1.name)
        expect(page).to have_content(hobbyist1.actual_free_hours)
        expect(page).to have_content(hobbyist1.disposible_income)
      end
    end
  end
end