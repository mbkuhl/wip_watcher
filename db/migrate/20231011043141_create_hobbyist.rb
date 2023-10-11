class CreateHobbyist < ActiveRecord::Migration[7.0]
  def change
    create_table :hobbyists do |t|
      t.string :name
      t.integer :weekly_free_hours
      t.integer :disposible_income
      t.boolean :has_kids
      t.integer :actual_free_hours

      t.timestamps
    end
  end
end
