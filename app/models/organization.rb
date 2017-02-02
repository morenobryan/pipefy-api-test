class Organization < ApplicationRecord
  has_many :pipes

  ORGANIZATION_ID = 49_232

  class << self
    def create_or_update_from_remote(organization_id)
      response = PipefyApi::Organization.find(organization_id)
      organization = PipefyApi::Mapper::Organization.map(response)
      organization.save!
      response
    end
  end
end
