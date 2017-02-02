class Phase < ApplicationRecord
  has_many :fields
  has_many :cards, foreign_key: 'current_phase_id'
  belongs_to :pipe

  class << self
    def create_or_update_from_remote(phase_id)
      response = PipefyApi::Phase.find(phase_id)
      phase = PipefyApi::Mapper::Phase.map(response)
      phase.save!
      response
    end
  end
end
