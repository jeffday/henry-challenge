require 'test_helper'
class CheckReservationConfirmationJobTest < ActiveSupport::TestCase
  setup do
    @reservation = reservations(:one)
    @appointment = appointments(:one)
    @reservation.appointment_id = @appointment.id
  end

  test "should not do anything if reservation is confirmed" do
    @reservation.confirmed = DateTime.now()
    @reservation.save

    job = CheckReservationConfirmationJob.new

    assert_no_difference 'Reservation.count' do
      job.perform(@reservation.id)
    end
  end

  test "should not do anything if reservation isn't confirmed and 30 minutes hasn't elapsed yet since it was created" do
    @reservation.created_at = DateTime.now()
    @reservation.save

    job = CheckReservationConfirmationJob.new

    assert_no_difference 'Reservation.count' do
      job.perform(@reservation.id)
    end
  end

  test "should destroy the reservation and free the appointment if 30 minutes has elapsed since it was created without a confirmation" do
    @reservation.created_at = 1.hour.before(DateTime.now())
    @reservation.save

    job = CheckReservationConfirmationJob.new

    assert_difference 'Reservation.count', -1 do
      job.perform(@reservation.id)
    end

    reserved_appt = Appointment.find(@appointment.id)

    assert_equal reserved_appt.taken, false, "Originally reserved appointment should no longer be marked as taken"
  end
end
