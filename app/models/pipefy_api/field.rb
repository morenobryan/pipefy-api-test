module PipefyApi
  class Field
    include PipefyApi::Base
    base_uri 'app.pipefy.com'

    def self.find(field_id)
      response = get("/fields/#{field_id}.json", default_headers)
      parse_response(response)
    end
  end
end
