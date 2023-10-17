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
          expect(page).to have_content("Build Shelves")
          expect(page).to_not have_content("Play BG3")
          expect(page).to have_content("Replace Exterior Door")
          expect(page).to have_content("Sew Halloween Costume")
        end
      end
    end


# User Story 18, Child Update From Childs Index Page 

# As a visitor
# When I visit the `child_table_name` index page or a parent `child_table_name` index page
# Next to every child, I see a link to edit that child's info
# When I click the link
# I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 14
  describe "As a user" do
    describe "when I visit '/projects', next to every project, I see a link to edit that project's info" do
      it "When I click the link, I should be taken to that project's edit page where I can update its information" do
        visit "/projects"
        projects = Project.all
        projects.each do |project|
          expect(page).to have_link("Update #{project.project_name}", href: "/projects/#{project.id}/update")
          click_link("Update #{project.project_name}")
          expect(current_path).to eq("/projects/#{project.id}/update")
          visit "/projects"
        end
      end


      # User Story 23, Child Delete From Childs Index Page 

      # As a visitor
      # When I visit the `child_table_name` index page or a parent `child_table_name` index page
      # Next to every child, I see a link to delete that child
      # When I click the link
      # I should be taken to the `child_table_name` index page where I no longer see that child

      describe "When I visit the project index page, next to every project, I see a link to delete that project" do
        it "When I click the link, I am returned to the project index where I no longer see that project" do
          visit "/projects"
          expect(@project1.project_name).to appear_before("Delete #{@project1.project_name}")
          expect("Delete #{@project1.project_name}").to appear_before(@project2.project_name)
          expect(@project2.project_name).to appear_before("Delete #{@project2.project_name}")
          expect("Delete #{@project2.project_name}").to appear_before(@project3.project_name)
          expect(@project3.project_name).to appear_before("Delete #{@project3.project_name}")
          expect("Delete #{@project3.project_name}").to appear_before(@project4.project_name)
          expect(@project4.project_name).to appear_before("Delete #{@project4.project_name}")
          click_link("Delete #{@project1.project_name}")
          expect(page).to_not have_content(@project1.project_name)
          expect(current_path).to eq("/projects")
          click_link("Delete #{@project3.project_name}")
          expect(page).to_not have_content(@project3.project_name)
          expect(current_path).to eq("/projects")
          click_link("Delete #{@project2.project_name}")
          expect(page).to_not have_content(@project2.project_name)
          expect(current_path).to eq("/projects")
        end
      end
    end

# As a visitor
# When I visit an index page ('/parents') or ('/child_table_name')
# Then I see a text box to filter results by keyword
# When I type in a keyword that is an partial match of one or more of my records and press the Search button
# Then I only see records that are an partial match returned on the page

    describe "When I visit the projects index page, I see a text box to filter results by keyword" do
      describe " When I type in a keyword that is a partial match of one or more of my records and press the Search button" do
        it "Then I only see records that are a partial match on the return page" do
          @project7 = @hobbyist3.projects.create!(project_name: "Crochet Purse", required_time: 60, current_completion: 70, start_cost: 150, cost_rate: 3)
          visit '/projects'
          expect(page).to have_content("Search by project name - Partial Match")
          fill_in('Project Name', with: 'Crochet')
          click_button("Search")
          expect(current_path).to eq("/projects")
          expect(page).to have_content(@project7.project_name)
          expect(page).to have_content(@project2.project_name)
          expect(page).to_not have_content(@project1.project_name)
          expect(page).to_not have_content(@project3.project_name)
          expect(page).to_not have_content(@project4.project_name)
          visit '/projects'
          fill_in('Project Name', with: 'Sew')
          click_button("Search")
          expect(page).to have_content(@project4.project_name)
          expect(page).to_not have_content(@project1.project_name)
          expect(page).to_not have_content(@project2.project_name)
          expect(page).to_not have_content(@project3.project_name)
          expect(page).to_not have_content(@project7.project_name)
        end
      end
    end
  end
end