class CreateProjectsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.integer :required_time
      t.integer :current_completion
      t.integer :start_cost
      t.integer :cost_rate
      t.boolean :completed, default: false
      t.boolean :abandoned, default: false

      t.timestamps
    end
  end
end
