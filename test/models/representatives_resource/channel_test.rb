require './test/test_helper'

module RepresentativesResource
  class ChannelTest < Minitest::Test
    def setup
      stub_civic_information
      @channel = CivicInformation::RepresentativesResource.where().
        officials.first.channels.first
    end

    def test_responds_to_id
      assert_respond_to @channel, :id
    end

    def test_responds_to_type
      assert_respond_to @channel, :type
    end
  end
end