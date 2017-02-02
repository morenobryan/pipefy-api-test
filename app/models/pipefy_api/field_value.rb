module PipefyApi
  class FieldValue
    include PipefyApi::Base
    base_uri 'app.pipefy.com'

    def self.find(field_value_id)
      response = get("/card_field_values/#{field_value_id}.json", default_headers)
      response = parse_response(response)
      response[:card_id] = response[:card][:id]
      response
    end
  end
end
