Allows providers to submit times they are available for appointments
 POST openings
    provider_id: id
    start: datetime
    end: datetime

Allows a client to retrieve a list of available appointment slots
 GET appointments
    provider_id: id

Allows clients to reserve an available appointment slot
  POST reservations
    appointment_id: id
    client_id: id

Allows clients to confirm their reservation
  PUT reservations
    reservation_id: id