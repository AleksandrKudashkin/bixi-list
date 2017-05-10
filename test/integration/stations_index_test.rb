require "test_helper"

class StationsIndexTest < ActionDispatch::IntegrationTest
  setup { get stations_path }

  test "has form for filter" do
    assert_select "form[action=?]", stations_path
  end

  test "have right number of rows in table" do
    assert_select "tr", count: 3 # 2 fixtures + 1 for TH row
  end
end
