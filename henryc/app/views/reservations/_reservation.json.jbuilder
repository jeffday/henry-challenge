json.extract! reservation, :id, :opening_id, :client_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
