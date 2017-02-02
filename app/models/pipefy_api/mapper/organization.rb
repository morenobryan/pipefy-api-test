module PipefyApi
  module Mapper
    class Organization
      def self.map(response)
        properties = filter_params(response)
        organization = ::Organization.find(properties[:id])
        organization.assign_attributes(properties)
        organization
      rescue ActiveRecord::RecordNotFound
        ::Organization.new(properties)
      end

      def self.filter_params(params)
        params.slice(:id, :name, :created_at, :updated_at)
      end
    end
  end
end
