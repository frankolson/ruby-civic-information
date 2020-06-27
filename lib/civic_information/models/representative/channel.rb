module CivicInformation
  class Representative::Channel
    attr_accessor :id, :type

    def initialize(channel_json)
      @id = channel_json["id"]
      @type = channel_json["type"]
    end
  end
end
