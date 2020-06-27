module CivicInformation
  class Representative::Official
    attr_accessor :name, :photo_url, :party, :phones, :emails, :urls, :channels,
      :addresses

    def initialize(official_json)
      @name = official_json["name"]
      @photo_url = official_json["photoUrl"]
      @party = official_json["party"]
      @phones = official_json["phones"] || []
      @emails = official_json["emails"] || []
      @urls = official_json["urls"] || []
      @channels = build_channels(official_json["channels"] || [])
      @addresses = build_addresses(official_json["address"] || [])
    end

    private

      def build_addresses(address_json)
        address_json.map { |address| Representative::Address.new(address) }
      end

      def build_channels(channels_json)
        channels_json.map { |channel| Representative::Channel.new(channel) }
      end
  end
end
