# TODO Move this outside of models folder
module PipefyApi
  module Base
    def default_headers
      {
        headers: {
          'X-User-Email' => 'pipefydevrecruitingfakeuser@mailinator.com',
          'X-User-Token' => 'piBag2uUBesD6X1q78FR',
          'Accept' => 'application/json'
        }
      }
    end

    def parse_response(response)
      raise response.inspect unless response.code == 200
      JSON.parse(response.body, symbolize_names: true)
    end

    def self.included(base)
      base.extend Base
      base.include HTTParty
    end
  end
end
