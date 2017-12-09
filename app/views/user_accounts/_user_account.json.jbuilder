json.extract! user_account, :id, :account_number, :user_name, :created_at, :updated_at
json.url user_account_url(user_account, format: :json)
