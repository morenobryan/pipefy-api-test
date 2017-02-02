class Field < ApplicationRecord
  has_many :field_values
  belongs_to :phase
  belongs_to :type

  class << self
    def create_or_update_from_remote(field)
      response = PipefyApi::Field.find(field)
      field = PipefyApi::Mapper::Field.map(response)
      field.save!
      response
    end
  end
end
