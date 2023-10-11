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
          hobbyist1 = Hobbyist.create!(name: "Mike")
          hobbyist2 = Hobbyist.create!(name: "Bob")
          hobbyist3 = Hobbyist.create!(name: "Joe")
          #act
          visit "/hobbyists"
  
          #assert
          expect(page).to have_content(hobbyist1.name)
          expect(page).to have_content(hobbyist2.name)
          expect(page).to have_content(hobbyist3.name)
        end
      end
    end
  end