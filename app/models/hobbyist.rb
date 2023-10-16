class Hobbyist < ApplicationRecord
  has_many :projects

  def actual_free_hours
    if has_kids
      weekly_free_hours / 4
    else
      weekly_free_hours
    end
  end

  def self.sort_projects(hobbyist_id)
    Hobbyist.find(hobbyist_id).projects.order(:project_name)
  end

  def self.filter_current_completion(hobbyist, current_completion)
    hobbyist.projects.where("current_completion > #{current_completion}")
  end

end