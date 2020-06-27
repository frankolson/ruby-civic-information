module CivicInformation
  class Representative::Official
    attr_accessor :name, :phones, :addresses

    def initialize(official_json)
      @name = official_json["name"]
      @phones = official_json["phones"] || []
      @addresses = build_addresses(official_json["address"] || [])
    end

    private

      def build_addresses(address_json)
        address_json.map { |address| Representative::Address.new(address) }
      end
  end
end
