class Card < ApplicationRecord
  has_many :field_values
  belongs_to :current_phase, class_name: 'Phase'

  class << self
    def create_or_update_from_remote(card_id)
      response = PipefyApi::Card.find(card_id)
      card = PipefyApi::Mapper::Card.map(response)
      card.save!
      response
    end
  end
end
