class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :skill_type_id
      t.integer :level

      t.timestamps
    end
  end
end
