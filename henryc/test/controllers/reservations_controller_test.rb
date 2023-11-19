require "test_helper"

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = clients(:one)
    @provider = providers(:one)
    @appointment = Appointment.create(provider_id: @provider.id, start_time: Time.now + 2.days, end_time: Time.now + 2.days + 2.hours)
    @reservation = reservations(:one)
  end

  test "should create reservation" do
    assert_difference("Reservation.count") do
      post reservations_url, params: { client_id: @client.id, appointment_id: @appointment.id }
    end

    assert_response :created
  end

  test "should update reservation" do
    patch reservation_url(@reservation), params: { reservation: { id: @reservation.id } }
    assert_response :ok
  end

  test "should destroy reservation" do
    assert_difference("Reservation.count", -1) do
      delete reservation_url(@reservation)
    end

    assert :no_content
  end
end
