class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :level
      t.integer :experience
      t.integer :user_id
      t.integer :available_points
      t.integer :ethnicity_id

      t.timestamps
    end
  end
end
