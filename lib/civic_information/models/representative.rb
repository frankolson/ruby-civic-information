module CivicInformation
  class Representative
    attr_accessor :name, :phones

    def self.where(address: nil)
      response = CivicInformation.get "/representatives", query: {
          key: CivicInformation.configuration.google_api_key,
          address: address,
          roles: ['legislatorLowerBody', 'legislatorUpperBody']
        }

      response.parsed_response["officials"].map do |representative|
        self.new(representative)
      end
    end

    def initialize(representative_json)
      @name = representative_json["name"]
      @phones = representative_json["phones"]
    end
  end
end
