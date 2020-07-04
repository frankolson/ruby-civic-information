module CivicInformation
  class RepresentativesResource
    attr_accessor :divisions, :offices, :officials

    def self.where(address: nil, roles: nil, levels: nil)
      response = CivicInformation.get "/representatives", query: {
          key: CivicInformation.configuration.google_api_key,
          address: address,
          roles: roles,
          levels: levels
        }.delete_if { |k, v| v.nil? }

      self.new response: response
    end

    def initialize(response:)
      @divisions = build_divisions(response.parsed_response["divisions"] || [])
      @offices = build_offices(response.parsed_response["offices"] || [])
      @officials = build_officials(response.parsed_response["officials"] || [])
    end

    private

      def build_divisions(divisions_response)
        divisions_response.map do |open_civic_data_id, division|
          RepresentativesResource::Division.new(
            open_civic_data_id: open_civic_data_id,
            division_json: division,
            parent_resource_id: self.object_id
          )
        end
      end

      def build_offices(offices_response)
        offices_response.each_with_index.map do |office, result_index|
          RepresentativesResource::Office.new(
            result_index: result_index,
            office_json: office,
            parent_resource_id: self.object_id
          )
        end
      end

      def build_officials(officials_response)
        officials_response.each_with_index.map do |official, result_index|
          RepresentativesResource::Official.new(
            result_index: result_index,
            official_json: official,
            parent_resource_id: self.object_id
          )
        end
      end
  end
end
