desc "Generate some dummy data so we can test the API"
namespace :db do
    task populate_database: [:environment]  do
        provider = Provider.create(first_name: "spectrunculus", last_name: "grandis")

        client = Client.create(first_name: "chondracanthus", last_name: "lepophidii")

        openings = []

        (1..5).each do |i|
            Rails.logger.info(i)
            cur_date = Date.today + i

            start_date = DateTime.new(cur_date.year, cur_date.month, cur_date.day, 9, 0, 0)
            end_date = DateTime.new(cur_date.year, cur_date.month, cur_date.day, 17, 0, 0)

            opening = Opening.create(provider_id: provider.id, start: start_date, end: end_date)

            openings << opening
        end

        reservation = Reservation.create(opening_id: openings[2].id, client_id: client.id)
    end
end