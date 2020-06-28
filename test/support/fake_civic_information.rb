require 'sinatra/base'

class FakeCivicInformation < Sinatra::Base
  get '/civicinfo/v2/representatives' do
    json_response 200, 'representatives.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end