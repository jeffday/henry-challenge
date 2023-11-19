require "test_helper"

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @provider = providers(:one)
  end

  test "should get index" do
    get appointments_url params: { provider_id: @provider.id }
    assert_response :success
  end
end
