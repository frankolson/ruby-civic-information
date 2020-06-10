module CivicInformation
  class Representative
    attr_accessor :name, :phones

    def self.where(address: nil, roles: nil)
      response = CivicInformation.get "/representatives", query: {
          key: CivicInformation.configuration.google_api_key,
          address: address,
          roles: roles
        }.delete_if { |k, v| v.nil? }
      officials = response.parsed_response["officials"] || []

      officials.map do |representative|
        self.new(representative)
      end
    end

    def initialize(representative_json)
      @name = representative_json["name"]
      @phones = representative_json["phones"]
    end
  end
end
