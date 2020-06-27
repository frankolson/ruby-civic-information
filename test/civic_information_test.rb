require "test_helper"

class CivicInformationTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::CivicInformation::VERSION
  end
end
