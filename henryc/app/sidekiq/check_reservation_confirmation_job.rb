class CheckReservationConfirmationJob
  include Sidekiq::Job

  # if this reservation has existed without being confirmed for 30 minutes, we destroy it and free up the appointment slot again
  def perform(reservation_id)
    reservation = Reservation.find(reservation_id)

    unless reservation.confirmed?
      if 30.minutes.after(reservation.created_at) < DateTime.now
        appt = Appointment.find(reservation.appointment_id)
        appt.update(taken: false)
        reservation.destroy
      end
    end
  end
end
