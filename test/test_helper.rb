# Support files
# Dir['./support/**/*.rb'].each {|f| require f}
# require_relative './support/fake_civic_information'

#test/test_helper.rb
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'civic_information'

$LOAD_PATH.unshift File.expand_path("../../test", __FILE__)
require_relative 'support/fake_civic_information'


require 'minitest/autorun'
require 'webmock/minitest'
require 'byebug'

WebMock.disable_net_connect!

CivicInformation.configure do |config|
  config.google_api_key = 'test-key'
end

def stub_civic_information
  stub_request(:any, /googleapis.com/).
    to_rack(FakeCivicInformation)
end

def representatives_response_data
  File.read('./test/support/fixtures/representatives.json')
end
