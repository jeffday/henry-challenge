desc "Generate some dummy data so we can test the API"
namespace :db do
    task populate_database: [:environment]  do
        provider = Provider.create(first_name: "spectrunculus", last_name: "grandis")

        client = Client.create(first_name: "chondracanthus", last_name: "lepophidii")

        (1..5).each do |i|
            cur_date = Date.today + i

            start_date = DateTime.new(cur_date.year, cur_date.month, cur_date.day, 9, 0, 0)
            end_date = DateTime.new(cur_date.year, cur_date.month, cur_date.day, 17, 0, 0)

            opening = Opening.create(provider_id: provider.id, start: start_date, end: end_date)

            opening.create_appointments
        end

        reservation = Reservation.create(appointment_id: Appointment.last.id, client_id: client.id)
    end
end