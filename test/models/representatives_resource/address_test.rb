require './test/test_helper'

module RepresentativesResource
  class AddressTest < Minitest::Test
    def setup
      @address = CivicInformation::RepresentativesResource::Address.new(
        JSON.parse(representatives_response_data)['officials'].
          first['address'].first
      )
    end

    def test_responds_to_location_name
      assert_respond_to @address, :location_name
    end

    def test_responds_to_line_one
      assert_respond_to @address, :line_one
    end

    def test_responds_to_line_two
      assert_respond_to @address, :line_two
    end

    def test_responds_to_line_three
      assert_respond_to @address, :line_three
    end

    def test_responds_to_city
      assert_respond_to @address, :city
    end

    def test_responds_to_state
      assert_respond_to @address, :state
    end

    def test_responds_to_zip
      assert_respond_to @address, :zip
    end
  end
end