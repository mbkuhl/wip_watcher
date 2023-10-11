class CreateWip < ActiveRecord::Migration[7.0]
  def change
    create_table :wips do |t|
      t.string :project_name
      t.integer :required_time
      t.integer :current_completion
      t.integer :start_cost
      t.integer :cost_rate
      t.boolean :completed
      t.boolean :abandoned

      t.timestamps
    end
  end
end
