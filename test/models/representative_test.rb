require './test/test_helper'

class RepresentativeTest < Minitest::Test
  def test_exists
    assert CivicInformation::Representative
  end
end