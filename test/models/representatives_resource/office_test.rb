require './test/test_helper'

module RepresentativesResource
  class OfficeTest < Minitest::Test
    def setup
      stub_civic_information
      @office = CivicInformation::RepresentativesResource.where().
        offices.first
    end

    def test_responds_to_result_index
      assert_respond_to @office, :result_index
    end

    def test_responds_to_division_id
      assert_respond_to @office, :division_id
    end

    def test_responds_to_name
      assert_respond_to @office, :name
    end

    def test_responds_to_levels
      assert_respond_to @office, :levels
      assert_instance_of Array, @office.levels
    end

    def test_responds_to_official_indices
      assert_respond_to @office, :official_indices
      assert_instance_of Array, @office.official_indices
    end

    def test_responds_to_roles
      assert_respond_to @office, :roles
      assert_instance_of Array, @office.roles
    end

    def test_responds_to_sources
      assert_respond_to @office, :sources
      assert_instance_of Array, @office.sources
    end

    def test_responds_to_division
      assert_respond_to @office, :division
      assert_instance_of CivicInformation::RepresentativesResource::Division,
        @office.division
    end

    def test_responds_to_officials
      assert_respond_to @office, :officials
      assert_instance_of Array, @office.officials
      assert_instance_of CivicInformation::RepresentativesResource::Official,
        @office.officials.first
    end
  end
end