class Opening < ApplicationRecord
    validate :fits_at_least_one_appointment

    def create_appointments
        end_offset = number_of_appointments - 1

        # TODO: error handling if appointment creation fails
        (0..end_offset).each do |i|
            offset = i * Appointment::APPOINTMENT_LENGTH

            start_time = self.start + offset
            end_time = start_time + Appointment::APPOINTMENT_LENGTH 

            Appointment.create(provider_id: self.provider_id, start_time: start_time, end_time: end_time)
        end
    end

    private

    def duration
        self.end - self.start
    end

    def number_of_appointments
        (duration / Appointment::APPOINTMENT_LENGTH).floor
    end

    def fits_at_least_one_appointment
        errors.add(:base, "The duration of the opening needs to fit at least one appointment.") unless number_of_appointments >= 1
    end
end
