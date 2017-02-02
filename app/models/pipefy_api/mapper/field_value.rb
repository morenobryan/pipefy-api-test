module PipefyApi
  module Mapper
    class FieldValue
      def self.map(response)
        properties = filter_params(response)
        field_value = ::FieldValue.find(properties[:id])
        field_value.assign_attributes(properties)
        field_value
      rescue ActiveRecord::RecordNotFound
        ::FieldValue.new(properties)
      end

      def self.filter_params(params)
        params.slice(:id, :field_id, :value, :display_value, :card_id, :created_at, :updated_at)
      end
    end
  end
end
