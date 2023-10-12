class DropWiPsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :wips
  end
end
