module CivicInformation
  class RepresentativesResource::Office
    attr_accessor :result_index, :division_id, :levels, :name,
      :official_indices, :roles, :sources

    def initialize(result_index:, office_json:, parent_resource_id:)
      @parent_resource_id = parent_resource_id
      @result_index = result_index
      @division_id = office_json['divisionId']
      @levels = office_json['levels']
      @name = office_json['name']
      @roles = office_json['roles']
      @sources = office_json['sources']
      @official_indices = office_json['officialIndices']
    end

    def officials
      parent_resource.officials.select do |official|
        @official_indices.inclue? official.result_index
      end
    end

    def division
      parent_resource.divisions.find do |division|
        division.open_civic_data_id == division_id
      end
    end

    private

      def parent_resource
        ObjectSpace._id2ref(@parent_resource_id)
      end
  end
end
