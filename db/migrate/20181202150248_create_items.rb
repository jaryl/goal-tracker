class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :goal, foreign_key: true
      t.integer :item_value

      t.timestamps
    end
  end
end
