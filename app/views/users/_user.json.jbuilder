json.extract! user, :id, :email, :name, :surname, :birthday, :phone_number, :is_admin, :created_at, :updated_at
json.url user_url(user, format: :json)
