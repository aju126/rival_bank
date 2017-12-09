json.extract! user_document, :id, :created_at, :updated_at
json.url user_document_url(user_document, format: :json)
