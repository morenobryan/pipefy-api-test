module PipefyApi
  class Phase
    include PipefyApi::Base
    base_uri 'app.pipefy.com'

    def self.find(phase_id)
      response = get("/phases/#{phase_id}.json", default_headers)
      parse_response(response)
    end
  end
end
