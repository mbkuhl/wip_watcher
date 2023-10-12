class AddHobbyistToProjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :hobbyist, null: false, foreign_key: true
  end
end
