class Character < ApplicationRecord
  belongs_to :user
  belongs_to :ethnicity
  validates_associated :user
end
