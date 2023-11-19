require "test_helper"

class OpeningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @opening = openings(:one)
    @provider = providers(:one)
  end

  test "should get index" do
    get openings_url, params: {provider_id: @provider.id, format: :json}
    assert_response :success
  end

  test "should create opening" do
    assert_difference("Opening.count") do
      post openings_url, params: { provider_id: @provider.id, opening: { date: @opening.date, end: @opening.end, start: @opening.start } }
    end

    assert_response :created
  end

end
