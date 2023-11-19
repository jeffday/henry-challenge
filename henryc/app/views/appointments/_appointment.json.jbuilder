json.extract! appointment, :id, :provider_id, :start_time, :end_time
json.url appointment_url(appointment, format: :json)
