class Ethnicity < ApplicationRecord
  has_many :skill_types
  has_many :skills, through: :skill_types

  def available_skills
    skill_types.pluck :name
  end
end
