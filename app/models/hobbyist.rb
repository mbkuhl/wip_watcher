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

  def self.sort_by_num_projects
    projects = Hobbyist.all.reduce({}) do |count, hobbyist|
      count[hobbyist] = hobbyist.projects.count
      count
    end
    projects.sort_by { | _, count | count }.to_a.map { |count| count[0] }.reverse
  end

  def set_count(set_value = false)
    if set_value
      @project_count = projects.count
    end
  end

  def project_count
    @project_count
  end

end