module CivicInformation
  class RepresentativesResource::Address
    attr_accessor :location_name, :line_one, :line_two, :line_three, :city,
      :state, :zip

    def initialize(address_json)
      @location_name = address_json["locationName"]
      @line_one = address_json["line1"]
      @line_two = address_json["line2"]
      @line_three = address_json["line3"]
      @city = address_json["city"]
      @state = address_json["state"]
      @zip = address_json["zip"]
    end
  end
end
