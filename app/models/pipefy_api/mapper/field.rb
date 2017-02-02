module PipefyApi
  module Mapper
    class Field
      def self.map(response)
        properties = filter_params(response)
        field = ::Field.find(properties[:id])
        field.assign_attributes(properties)
        field
      rescue ActiveRecord::RecordNotFound
        ::Field.new(properties)
      end

      def self.filter_params(params)
        params.slice(:id, :phase_id, :label, :default_value, :type_id,
                     :index, :created_at, :updated_at)
      end
    end
  end
end
