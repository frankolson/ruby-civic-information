require "httparty"
require "civic_information/version"
require "civic_information/configuration"
require "civic_information/models/representatives_resource"
require "civic_information/models/representatives_resource/division"
require "civic_information/models/representatives_resource/office"
require "civic_information/models/representatives_resource/official"
require "civic_information/models/representatives_resource/channel"
require "civic_information/models/representatives_resource/address"

module CivicInformation
  include HTTParty
  base_uri "https://www.googleapis.com/civicinfo/v2"
  disable_rails_query_string_format

  class Error < StandardError; end
end
