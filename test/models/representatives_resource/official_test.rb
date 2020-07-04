require './test/test_helper'

module RepresentativesResource
  class OfficialTest < Minitest::Test
    def setup
      stub_civic_information
      @official = CivicInformation::RepresentativesResource.where().
        officials.first
    end

    def test_responds_to_name
      assert_respond_to @official, :name
    end

    def test_responds_to_photo_url
      assert_respond_to @official, :photo_url
    end

    def test_responds_to_party
      assert_respond_to @official, :party
    end

    def test_responds_to_phones
      assert_respond_to @official, :phones
      assert_instance_of Array, @official.phones
    end

    def test_responds_to_emails
      assert_respond_to @official, :emails
      assert_instance_of Array, @official.emails
    end

    def test_responds_to_urls
      assert_respond_to @official, :urls
      assert_instance_of Array, @official.urls
      assert_instance_of Array, @official.urls
    end

    def test_responds_to_channels
      assert_respond_to @official, :channels
      assert_instance_of Array, @official.channels
      assert_instance_of CivicInformation::RepresentativesResource::Channel,
        @official.channels.first
    end

    def test_responds_to_addresses
      assert_respond_to @official, :addresses
      assert_instance_of Array, @official.addresses
      assert_instance_of CivicInformation::RepresentativesResource::Address,
        @official.addresses.first
    end
  end
end