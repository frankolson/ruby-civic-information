module CivicInformation
  class RepresentativesResource::Official
    attr_accessor :result_index, :name, :photo_url, :party, :phones, :emails,
      :urls, :channels, :addresses

    def initialize(result_index:, official_json:, parent_resource_id:)
      @parent_resource_id = parent_resource_id
      @result_index = result_index
      @name = official_json["name"]
      @photo_url = official_json["photoUrl"]
      @party = official_json["party"]
      @phones = official_json["phones"] || []
      @emails = official_json["emails"] || []
      @urls = official_json["urls"] || []
      @channels = build_channels(official_json["channels"] || [])
      @addresses = build_addresses(official_json["address"] || [])
    end

    def offices
      parent_resource.offices.select do |office|
        office.official_indices.include? result_index
      end
    end

    private

      def build_addresses(address_json)
        address_json.map { |address| RepresentativesResource::Address.new(address) }
      end

      def build_channels(channels_json)
        channels_json.map { |channel| RepresentativesResource::Channel.new(channel) }
      end

      def parent_resource
        ObjectSpace._id2ref(@parent_resource_id)
      end
  end
end
