class ReservationStartValidator < ActiveModel::Validator
    def validate(record)
      if Appointment.find(record.appointment_id).start_time <= Time.now + 24.hours
        record.errors.add :base, "Can't make a reservation less than 24 hours in advance"
      end
    end
  end