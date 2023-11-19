class Opening < ApplicationRecord
    # TODO: validation that opening is long enough to accommodate at least one appointment

    def create_appointments
        window = self.end - self.start

        number_of_appointments = window / (Appointment::APPOINTMENT_LENGTH)

        end_offset = number_of_appointments.floor - 1

        # TODO: error handling if appointment creation fails
        (0..end_offset).each do |i|
            offset = i * Appointment::APPOINTMENT_LENGTH

            start_time = self.start + offset
            end_time = start_time + Appointment::APPOINTMENT_LENGTH 

            Appointment.create(provider_id: self.provider_id, start_time: start_time, end_time: end_time)
        end
    end
end
