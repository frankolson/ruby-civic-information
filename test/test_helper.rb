#test/test_helper.rb
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'civic_information'

require 'minitest/autorun'
require 'webmock/minitest'