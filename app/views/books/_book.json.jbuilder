json.extract! book, :id, :title, :release_date, :writers_id, :created_at, :updated_at
json.url book_url(book, format: :json)
