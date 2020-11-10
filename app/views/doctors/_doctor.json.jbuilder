json.extract! doctor, :id, :name, :surname, :specialization, :phone_number, :work_hours, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)
