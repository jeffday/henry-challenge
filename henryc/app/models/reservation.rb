class Reservation < ApplicationRecord
    has_one :appointment
    validates_with ReservationStartValidator, on: :create
    after_create :verify_confirmation

    def confirmed?
        confirmed != nil
    end

    private 

    def verify_confirmation
        CheckReservationConfirmationJob.perform_in(30.minutes, id)
    end
end
