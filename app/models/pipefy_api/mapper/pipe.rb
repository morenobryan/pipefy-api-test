module PipefyApi
  module Mapper
    class Pipe
      def self.map(response)
        properties = filter_params(response)
        pipe = ::Pipe.find(properties[:id])
        pipe.assign_attributes(properties)
        pipe
      rescue ActiveRecord::RecordNotFound
        ::Pipe.new(properties)
      end

      def self.filter_params(params)
        params.slice(:id, :name, :token, :can_edit, :organization_id, :created_at, :updated_at)
      end
    end
  end
end
