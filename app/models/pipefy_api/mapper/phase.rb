module PipefyApi
  module Mapper
    class Phase
      def self.map(response)
        properties = filter_params(response)
        phase = ::Phase.find(properties[:id])
        phase.assign_attributes(properties)
        phase
      rescue ActiveRecord::RecordNotFound
        ::Phase.new(properties)
      end

      def self.filter_params(params)
        params.slice(:id, :name, :pipe_id, :index, :can_edit, :created_at, :updated_at)
      end
    end
  end
end
