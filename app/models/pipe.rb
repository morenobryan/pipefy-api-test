class Pipe < ApplicationRecord
  has_many :phases
  belongs_to :organization

  class << self
    def create_or_update_from_remote(pipe_id)
      response = PipefyApi::Pipe.find(pipe_id)
      pipe = PipefyApi::Mapper::Pipe.map(response)
      pipe.save!
      response
    end
  end
end
