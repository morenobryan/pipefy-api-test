module PipefyApi
  class Organization
    include PipefyApi::Base
    base_uri 'app.pipefy.com'

    def self.find(organization_id)
      response = get("/organizations/#{organization_id}.json", default_headers)
      parse_response(response)
    end
  end
end
