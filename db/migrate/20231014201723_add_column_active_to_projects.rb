class AddColumnActiveToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :active, :boolean
    change_column_default :projects, :active, true
  end
end
