module CivicInformation
  class Representative
    attr_accessor :officials

    def self.where(address: nil, roles: nil)
      response = CivicInformation.get "/representatives", query: {
          key: CivicInformation.configuration.google_api_key,
          address: address,
          roles: roles
        }.delete_if { |k, v| v.nil? }

      self.new(
        officials: build_officials(response.parsed_response["officials"] || [])
      )
    end

    def initialize(officials:)
      @officials = officials
    end

    private

      def self.build_officials(officials_response)
        officials_response.
          map { |official| Representative::Official.new(official) }
      end
  end
end
