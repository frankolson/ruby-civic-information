require "httparty"
require "civic_information/version"
require "civic_information/configuration"
require "civic_information/models/representative"
require "civic_information/models/representative/official"
require "civic_information/models/representative/channel"
require "civic_information/models/representative/address"

module CivicInformation
  include HTTParty
  base_uri "https://www.googleapis.com/civicinfo/v2"
  disable_rails_query_string_format

  class Error < StandardError; end
end
