require 'rails_helper'

describe WIP, type: :model do
  describe '#create' do
    it 'can create objects from data' do
      hobbyist = Hobbyist.create!(name: "Mike", weekly_free_hours: 12, disposible_income: 1000, has_kids: false)
      project = hobbyist.WIPs.create!(project_name: "Build Shelves", required_time: 10, current_completion: 60, start_cost: 40, cost_rate: 0)
      expect(project.project_name).to eq("Build Shelves")
      expect(project.hobbyist.name).to eq("Mike")
    end
  end

  describe 'instance methods' do
    
  end
end