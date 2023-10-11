require 'rails_helper'

describe Hobbyist, type: :model do
  describe '#create' do
    it 'can create objects from data' do
      hobbyist = Hobbyist.create!(name: "Mike", weekly_free_hours: 12, disposible_income: 1000, has_kids: false)
      expect(hobbyist.name).to eq("Mike")
    end
  end

  describe 'instance methods' do
    
  end
end