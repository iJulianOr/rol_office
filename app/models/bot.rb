class Bot < ApplicationRecord
  has_many :messages, as: :sender
end
