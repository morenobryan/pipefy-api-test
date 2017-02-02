module PipefyApi
  class Card
    include PipefyApi::Base
    base_uri 'app.pipefy.com'

    def self.find(card_id)
      response = get("/cards/#{card_id}.json", default_headers)
      parse_response(response)
    end
  end
end
