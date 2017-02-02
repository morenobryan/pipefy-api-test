module PipefyApi
  module Mapper
    class Type
      def self.map(response)
        properties = filter_params(response)
        type = ::Type.find(properties[:id])
        type.assign_attributes(properties)
        type
      rescue ActiveRecord::RecordNotFound
        ::Type.new(properties)
      end

      def self.filter_params(params)
        params.slice(:id, :name, :component, :html_class, :created_at, :updated_at)
      end
    end
  end
end
