class SetDefaultValuesOfWiPsCompletedAndAbandoned < ActiveRecord::Migration[7.0]
  def change
    change_column_default :wips, :completed, false
    change_column_default :wips, :abandoned, false
  end
end
