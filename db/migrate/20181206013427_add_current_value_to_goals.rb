class AddCurrentValueToGoals < ActiveRecord::Migration[5.1]
  def change
    add_column :goals, :current_value, :integer, default: 0
  end
end
