require 'redis'
class SearchController < ApplicationController

	def search_list	  
	  if params['key'].nil? || params['key'].empty?
	  	return
	  else
		redis = Redis.new(host: "localhost")
		key_exists = redis.exists(params['key'])
		if key_exists
			data = JSON.parse(redis.get(params['key']))
		else
			book_data_from_db = Book.where(title: params['key'])
			data = []
			book_data_from_db.each {
				|book_data|
				data.push({'name' => book_data.title, 'release_date' => book_data.release_date, 'writer' => Writer.find(book_data.writers_id).name}) 
			}
			redis.set(params['key'], data.to_json)
		end
	  end
	  #Search.save_data
	end
end