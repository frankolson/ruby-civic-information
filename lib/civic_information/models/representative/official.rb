module CivicInformation
  class Representative::Official
    attr_accessor :name, :phones

    def initialize(official_json)
      @name = official_json["name"]
      @phones = official_json["phones"]
    end
  end
end
