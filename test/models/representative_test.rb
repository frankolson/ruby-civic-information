require './test/test_helper'

class RepresentativeTest < Minitest::Test
  def setup
    stub_civic_information
    @representative_resource = CivicInformation::Representative.where()
  end

  def test_gathering_data
    assert_respond_to CivicInformation::Representative, :where
  end

  def test_responds_to_officials
    assert_respond_to @representative_resource, :officials
    assert_instance_of Array, @representative_resource.officials
    assert_instance_of CivicInformation::Representative::Official,
      @representative_resource.officials.first
  end
end