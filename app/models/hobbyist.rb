class Hobbyist < ApplicationRecord
  has_many :projects

  def actual_free_hours
    if has_kids
      weekly_free_hours / 4
    else
      weekly_free_hours
    end
  end

end