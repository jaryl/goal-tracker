class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.integer :goal_value
      t.string :unit_of_measure

      t.timestamps
    end
  end
end
