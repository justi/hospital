json.extract! appointment, :id, :doctor_id, :nurse_id, :reservation_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
