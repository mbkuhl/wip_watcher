class RenameActualFreeHoursHobbyists < ActiveRecord::Migration[7.0]
  def change
    rename_column :hobbyists, :actual_free_hours, :afr
  end
end
