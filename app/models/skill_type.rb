class SkillType < ApplicationRecord
  belongs_to :ethnicity
  has_many :skills
end
