json.extract! user_information, :id, :name, :phone, :address, :email, :created_at, :updated_at
json.url user_information_url(user_information, format: :json)
