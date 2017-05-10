require "test_helper"

class StationTest < ActiveSupport::TestCase
  test "self.json_to_api" do
    assert_not_equal false, Station.json_from_api
  end

  setup do
    Station.delete_all
    @payload = Station.payload
    @disabled_stations = [
      { "b" => true },
      { "su" => true },
      { "m" => true }
    ]
  end

  test "self.payload" do
    assert_instance_of Hash, @payload
    assert @payload.key?("stations")
    assert @payload["stations"].count > 0
  end

  test "self.station_map" do
    mapping = Station.station_map(@payload["stations"].first)
    assert_instance_of Hash, mapping
    assert mapping.key?(:name) && mapping[:name].is_a?(String)
    assert mapping.key?(:bikes) && mapping[:bikes].is_a?(Integer)
    assert mapping.key?(:enabled) && mapping[:enabled].in?([true, false])
    assert mapping.key?(:distance) && mapping[:distance].is_a?(Float)
  end

  test "self.enabled?" do
    @disabled_stations.each do |station|
      assert_equal false, Station.enabled?(station)
    end
  end

  test "self.update_data" do
    Station.update_data
    assert_equal @payload["stations"].count, Station.count
  end
end
