require 'rails_helper'

RSpec.describe "Projects Index", type: :feature do

  before(:each) do
    @hobbyist1 = Hobbyist.create!(name: "Mike", weekly_free_hours: 10, disposible_income: 1000, has_kids: false)
    @project1 = @hobbyist1.projects.create!(project_name: "Build Shelves", required_time: 10, current_completion: 60, start_cost: 40, cost_rate: 0)
    @hobbyist2 = Hobbyist.create!(name: "Bob", weekly_free_hours: 12, disposible_income: 10000, has_kids: true)
    @project2 = @hobbyist2.projects.create!(project_name: "Crochet Scarf", required_time: 40, current_completion: 60, start_cost: 40, cost_rate: 1)
    @project3 = @hobbyist2.projects.create!(project_name: "Replace Exterior Door", required_time: 20, current_completion: 10, start_cost: 700, cost_rate: 10)
    @hobbyist3 = Hobbyist.create!(name: "Joe", weekly_free_hours: 5, disposible_income: 100000, has_kids: false)
    @project4 = @hobbyist3.projects.create!(project_name: "Sew Halloween Costume", required_time: 60, current_completion: 70, start_cost: 150, cost_rate: 3)
    @project_array = [@project1, @project2, @project3, @project4]
  end

  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes
  # (data from each column that is on the child table)

    describe "As a user" do
      describe "when I visit '/projects'" do
        it "I see each project in the system including attributes" do

          visit "/projects"
          #assert
          @project_array.each do |project|
            expect(page).to have_content(project.project_name)
            expect(page).to have_content(project.required_time)
            expect(page).to have_content(project.current_completion)
            expect(page).to have_content(project.start_cost)
            expect(page).to have_content(project.cost_rate)
            expect(page).to have_content(project.active)
            expect(page).to have_content(project.completed)
            expect(page).to have_content(project.abandoned)
          end
        end

          # User Story 15, Child Index only shows `true` Records 
          
          # As a visitor
          # When I visit the child index
          # Then I only see records where the boolean column is `true`

        it "The I only see records where the active column is `true`" do
          visit "/projects/#{@project2.id}/update"
          fill_in('Project Name', with: 'Play BG3')
          fill_in('Required Time', with: '200')
          fill_in('Current Completion', with: '15')
          fill_in('Start Cost', with: '80')
          fill_in('Cost Rate', with: '0')          
          fill_in('Active', with: 'false')          
          fill_in('Completed', with: 'false')          
          fill_in('Abandoned', with: 'true')          
          click_button('Update Project')
          visit "/projects"
          save_and_open_page
          expect(page).to have_content("Build Shelves")
          expect(page).to_not have_content("Play BG3")
          expect(page).to have_content("Replace Exterior Door")
          expect(page).to have_content("Sew Halloween Costume")

          
        
        end
      
      end
    end
    


  end