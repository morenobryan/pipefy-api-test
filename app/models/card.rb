class Card < ApplicationRecord
  belongs_to :current_phase_id
  belongs_to :previous_phase_id
  belongs_to :next_phase_id
end
