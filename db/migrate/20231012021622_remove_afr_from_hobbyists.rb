class RemoveAfrFromHobbyists < ActiveRecord::Migration[7.0]
  def change
    remove_column :hobbyists, :afr
  end
end
