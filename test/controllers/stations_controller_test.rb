require "test_helper"

class StationsControllerTest < ActionDispatch::IntegrationTest
  test "home url should be success" do
    get root_url
    assert_response :success
  end

  setup { get stations_url }

  test "stations_url should be success" do
    assert_response :success
  end

  test "renders right template" do
    assert_template "stations/index"
  end

  test "assings variables" do
    assert assigns(:min_distance)
    assert assigns(:last_update)
    assert assigns(:stations)
  end

  test "update condition" do
    Timecop.freeze(DateTime.now + REFRESH_TIMEOUT.minutes) do
      get stations_url
      assert Station.maximum(:updated_at) > REFRESH_TIMEOUT.minutes.ago
    end
  end
end
