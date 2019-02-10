class Attempt < ApplicationRecord
  # Associations
  belongs_to :quiz, inverse_of: :attempt
  belongs_to :option, inverse_of: :attempt
end
