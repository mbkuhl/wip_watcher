require 'rails_helper'

describe Project, type: :model do
  it {should belong_to :hobbyist}
  describe '#create' do
    it 'can create objects from data' do
      hobbyist = Hobbyist.create!(name: "Mike", weekly_free_hours: 12, disposible_income: 1000, has_kids: false)
      project = hobbyist.projects.create!(project_name: "Build Shelves", required_time: 10, current_completion: 60, start_cost: 40, cost_rate: 0)
      expect(project.project_name).to eq("Build Shelves")
      expect(project.required_time).to eq(10)
      expect(project.current_completion).to eq(60)
      expect(project.start_cost).to eq(40)
      expect(project.cost_rate).to eq(0)
      expect(project.abandoned).to be false
      expect(project.completed).to be false
      
    end

    it 'belongs to a hobbyist' do
      hobbyist = Hobbyist.create!(name: "Mike", weekly_free_hours: 12, disposible_income: 1000, has_kids: false)
      project = hobbyist.projects.create!(project_name: "Build Shelves", required_time: 10, current_completion: 60, start_cost: 40, cost_rate: 0)
      expect(project.hobbyist.name).to eq("Mike")
    end
  end

  describe 'instance methods' do
    
  end
end