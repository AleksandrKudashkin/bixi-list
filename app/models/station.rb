class Station < ApplicationRecord
  scope :active_with_bikes, -> { where("enabled = ? AND bikes > ?", true, 0) }

  def self.update_data
    Station.delete_all
    values = payload.fetch("stations", []).map { |station| station_map(station) }
    Station.import values
  end

  private

  class << self
    def json_from_api
      reqest = Typhoeus.get(API_ENDPOINT)
      reqest.success? ? reqest.body : false
    end

    def payload
      json_from_api ? JSON.parse(json_from_api) : {}
    end

    def station_map(station)
      {
        name: station["s"],
        bikes: station["ba"],
        enabled: enabled?(station),
        distance: Geocoder::Calculations.distance_between(
          [station["la"].to_f, station["lo"].to_f],
          [FX_LAT, FX_LNG]
        )
      }
    end

    def enabled?(station)
      station["b"] || station["su"] || station["m"] ? false : true
      # b - blocked, su - suspended, m - out of service
    end
  end
end
