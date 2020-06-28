require './test/test_helper'

module Representative
  class ChannelTest < Minitest::Test
    def setup
      @channel = CivicInformation::Representative::Channel.new(
        JSON.parse(representatives_response_data)['officials'].
          first['channels'].first
      )
    end

    def test_responds_to_id
      assert_respond_to @channel, :id
    end

    def test_responds_to_type
      assert_respond_to @channel, :type
    end
  end
end