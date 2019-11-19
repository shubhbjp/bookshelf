json.extract! writer, :id, :name, :address, :country, :state, :city, :pincode, :isActive, :created_at, :updated_at
json.url writer_url(writer, format: :json)
