class Reservation < ApplicationRecord
    has_one :appointment
    validates_with ReservationStartValidator, on: :create
end
