require './test/test_helper'

module Representative
  class OfficialTest < Minitest::Test
    def test_exists
      assert CivicInformation::Representative::Official
    end
  end
end