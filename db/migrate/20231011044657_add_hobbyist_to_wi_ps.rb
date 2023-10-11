class AddHobbyistToWiPs < ActiveRecord::Migration[7.0]
  def change
    add_reference :wips, :hobbyist, null: false, foreign_key: true
  end
end
