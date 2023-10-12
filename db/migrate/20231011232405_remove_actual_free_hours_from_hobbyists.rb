class RemoveActualFreeHoursFromHobbyists < ActiveRecord::Migration[7.0]
  def change
    remove_column :hobbyists, :actual_free_hours
  end
end
