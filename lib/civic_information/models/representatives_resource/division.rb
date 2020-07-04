module CivicInformation
  class RepresentativesResource::Division
    attr_accessor :open_civic_data_id, :also_known_as, :name

    def initialize(open_civic_data_id:, division_json:, parent_resource_id:)
      @parent_resource_id = parent_resource_id
      @open_civic_data_id = open_civic_data_id
      @also_known_as = division_json['alsoKnownAs'] || []
      @name = division_json['name']
    end

    def offices
      parent_resource.offices.select do |office|
        office.division_id == open_civic_data_id
      end
    end

    private

      def parent_resource
        ObjectSpace._id2ref(@parent_resource_id)
      end
  end
end
