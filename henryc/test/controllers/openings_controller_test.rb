require "test_helper"

class OpeningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @opening = openings(:one)
    @provider = providers(:one)
  end

  test "should create opening" do
    assert_difference("Opening.count") do
      post openings_url, params: { provider_id: @provider.id, end: Date.tomorrow + 1.days, start: Date.tomorrow }
    end

    assert_response :created
  end

end
