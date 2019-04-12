class Character < ApplicationRecord
  belongs_to :user
  belongs_to :ethnicity
  validates_associated :user

  has_many :skills, through: :ethnicity
end
