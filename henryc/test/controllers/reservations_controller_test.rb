require "test_helper"

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = clients(:one)
    @appointment = appointments(:one)
    @reservation = reservations(:one)
  end

  test "should create reservation" do
    assert_difference("Reservation.count") do
      post reservations_url, params: { reservation: { client_id: @reservation.client_id, appointment_id: @appointment.id } }
    end

    assert_response :created
  end

  test "should update reservation" do
    patch reservation_url(@reservation), params: { reservation: { client_id: @reservation.client_id, appointment_id: @appointment.id } }
    assert_response :ok
  end

  test "should destroy reservation" do
    assert_difference("Reservation.count", -1) do
      delete reservation_url(@reservation)
    end

    assert :no_content
  end
end
