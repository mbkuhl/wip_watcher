class AddActualFreeHoursToHobbyists < ActiveRecord::Migration[7.0]
  def change
    add_column :hobbyists, :actual_free_hours, :integer
  end
end
