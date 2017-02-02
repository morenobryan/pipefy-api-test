module PipefyApi
  module Mapper
    class Card
      def self.map(response)
        properties = filter_params(response)
        card = ::Card.find(properties[:id])
        card.assign_attributes(properties)
        card
      rescue ActiveRecord::RecordNotFound
        ::Card.new(properties)
      end

      def self.filter_params(params)
        params.slice(
          :id, :title, :current_phase_id, :due_date, :duration, :started_at,
          :finished_at, :expiration_time, :index, :token, :expired, :late,
          :draft, :done, :can_show_pipe, :created_at, :updated_at
        )
      end
    end
  end
end
