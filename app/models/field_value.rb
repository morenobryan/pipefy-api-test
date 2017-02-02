class FieldValue < ApplicationRecord
  belongs_to :field
  belongs_to :card

  class << self
    def create_or_update_from_remote(field_value_id)
      response = PipefyApi::FieldValue.find(field_value_id)
      field_value = PipefyApi::Mapper::FieldValue.map(response)
      field_value.save!
      response
    end
  end
end
