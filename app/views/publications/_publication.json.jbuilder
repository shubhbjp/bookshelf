json.extract! publication, :id, :name, :email, :contact, :address, :isActive, :created_at, :updated_at
json.url publication_url(publication, format: :json)
