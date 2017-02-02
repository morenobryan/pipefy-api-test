module PipefyApi
  class Pipe
    include PipefyApi::Base
    base_uri 'app.pipefy.com'

    def self.find(pipe_id)
      response = get("/pipes/#{pipe_id}.json", default_headers)
      response = parse_response(response)
      response[:organization_id] = ::Organization::ORGANIZATION_ID
      response
    end
  end
end
