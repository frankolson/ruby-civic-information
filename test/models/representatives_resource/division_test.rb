require './test/test_helper'

module RepresentativesResource
  class DivisionTest < Minitest::Test
    def setup
      stub_civic_information
      @division = CivicInformation::RepresentativesResource.where().
        divisions.first
    end

    def test_responds_to_open_civic_data_id
      assert_respond_to @division, :open_civic_data_id
    end

    def test_responds_to_name
      assert_respond_to @division, :name
    end

    def test_responds_to_also_known_as
      assert_respond_to @division, :also_known_as
      assert_instance_of Array, @division.also_known_as
    end

    def test_responds_to_offices
      assert_respond_to @division, :offices
      assert_instance_of Array, @division.offices
      assert_instance_of CivicInformation::RepresentativesResource::Office,
        @division.offices.first
    end
  end
end