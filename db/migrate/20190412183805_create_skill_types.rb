class CreateSkillTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :skill_types do |t|
      t.string :name
      t.integer :ethnicity_id

      t.timestamps
    end
  end
end
