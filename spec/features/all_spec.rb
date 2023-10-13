require 'rails_helper'

RSpec.describe "Usability", type: :feature do

#   User Story 8, Child Index Link

# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Child Index
  describe "As a visitor" do
    describe "When I visit any page on the site" do
      it "Then I see a link at the top of the page that takes me to the Projects Index" do
        hobbyist1 = Hobbyist.create!(name: "Mike", weekly_free_hours: 10, disposible_income: 1000, has_kids: false)
        project1 = hobbyist1.projects.create!(project_name: "Build Shelves", required_time: 10, current_completion: 60, start_cost: 40, cost_rate: 0)
        hobbyist2 = Hobbyist.create!(name: "Bob", weekly_free_hours: 12, disposible_income: 10000, has_kids: true)
        project2 = hobbyist2.projects.create!(project_name: "Crochet Scarf", required_time: 40, current_completion: 60, start_cost: 40, cost_rate: 1)
        project3 = hobbyist2.projects.create!(project_name: "Replace Exterior Door", required_time: 20, current_completion: 10, start_cost: 700, cost_rate: 10)
        hobbyist3 = Hobbyist.create!(name: "Joe", weekly_free_hours: 5, disposible_income: 100000, has_kids: false)
        project4 = hobbyist3.projects.create!(project_name: "Sew Halloween Costume", required_time: 60, current_completion: 70, start_cost: 150, cost_rate: 3)

        visit "/hobbyists"
        within("div#topBar") do
          expect(page).to have_content("Projects")
          expect(page).to have_link(nil, href: '/projects')
          click_link 'Projects'
        end
        expect(page)
        visit "/hobbyists/#{hobbyist1.id}"
        within("div#topBar") do
          expect(page).to have_content("Projects")
          expect(page).to have_link(nil, href: '/projects')
          click_link 'Projects'
        end
        visit "/hobbyists/#{hobbyist1.id}/projects"
        expect(page).to have_content("Projects")
        within("div#topBar") do
          expect(page).to have_content("Projects")
          expect(page).to have_link(nil, href: '/projects')
          click_link 'Projects'
        end
        within("div#topBar") do
          expect(page).to have_content("Projects")
          expect(page).to have_link(nil, href: '/projects')
          click_link 'Projects'
        end
        visit "/projects/#{project1.id}"
        within("div#topBar") do
          expect(page).to have_content("Projects")
          expect(page).to have_link(nil, href: '/projects')
          click_link 'Projects'
        end
      end
    end
  end

  # User Story 9, Parent Index Link

  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Parent Index

  describe "As a visitor" do
    describe "When I visit any page on the site" do
      it "Then I see a link at the top of the page that takes me to the Hobbyists Index" do
        hobbyist1 = Hobbyist.create!(name: "Mike", weekly_free_hours: 10, disposible_income: 1000, has_kids: false)
        project1 = hobbyist1.projects.create!(project_name: "Build Shelves", required_time: 10, current_completion: 60, start_cost: 40, cost_rate: 0)
        hobbyist2 = Hobbyist.create!(name: "Bob", weekly_free_hours: 12, disposible_income: 10000, has_kids: true)
        project2 = hobbyist2.projects.create!(project_name: "Crochet Scarf", required_time: 40, current_completion: 60, start_cost: 40, cost_rate: 1)
        project3 = hobbyist2.projects.create!(project_name: "Replace Exterior Door", required_time: 20, current_completion: 10, start_cost: 700, cost_rate: 10)
        hobbyist3 = Hobbyist.create!(name: "Joe", weekly_free_hours: 5, disposible_income: 100000, has_kids: false)
        project4 = hobbyist3.projects.create!(project_name: "Sew Halloween Costume", required_time: 60, current_completion: 70, start_cost: 150, cost_rate: 3)

        visit "/hobbyists"
        within("div#topBar") do
          expect(page).to have_content("Hobbyists")
          expect(page).to have_link(nil, href: '/hobbyists')
          click_link 'Hobbyists'
        end
        expect(page)
        visit "/hobbyists/#{hobbyist1.id}"
        within("div#topBar") do
          expect(page).to have_content("Hobbyists")
          expect(page).to have_link(nil, href: '/hobbyists')
          click_link 'Hobbyists'
        end
        visit "/hobbyists/#{hobbyist1.id}/projects"
        expect(page).to have_content("Hobbyists")
        within("div#topBar") do
          expect(page).to have_content("Hobbyists")
          expect(page).to have_link(nil, href: '/hobbyists')
          click_link 'Hobbyists'
        end
        within("div#topBar") do
          expect(page).to have_content("Hobbyists")
          expect(page).to have_link(nil, href: '/hobbyists')
          click_link 'Hobbyists'
        end
        visit "/projects/#{project1.id}"
        within("div#topBar") do
          expect(page).to have_content("Hobbyists")
          expect(page).to have_link(nil, href: '/hobbyists')
          click_link 'Hobbyists'
        end
      end
    end
  end

end