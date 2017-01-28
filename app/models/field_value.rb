class FieldValue < ApplicationRecord
  belongs_to :field
  belongs_to :card
end
