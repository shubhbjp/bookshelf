require 'redis'
class SearchController < ApplicationController

	def search_list
    @data = []
    if params['key'].nil? || params['key'].empty?
      return
	  else
		redis = Redis.new(host: "localhost")
		key_exists = redis.exists(params['key'])
		  if key_exists
			 @data = JSON.parse(redis.get(params['key']))
		  else  
        book_data_from_db = Book.where('title': params['key'])
				book_data_from_db.each { 
  				|book| 
          authors_data = []
          book.writers_id.each {
              |writer_id| 
                writer_data = Writer.find(writer_id)
                temp_writer_data = Hash.new(0)
                temp_writer_data['name'] = writer_data.name
                temp_writer_data['email'] = writer_data.email
                temp_writer_data['mobile'] = writer_data.mobile
                temp_writer_data['address'] = writer_data.address + ", " + writer_data.city['name'] + ", " + writer_data.state['name'] + ", " + writer_data.country['name'] + ". Pincode: " + writer_data.pincode.to_s
                authors_data.push(temp_writer_data)
            }
            publication_data = Publication.find(book.publications_id)
            book_data_in_hash = Hash.new(0)
            book_data_in_hash['title'] = book.title
            book_data_in_hash['about'] = book.about
            book_data_in_hash['category'] = book.category['name']
            book_data_in_hash['publication_date'] = book.publication_date
            book_data_in_hash['writers_info'] = authors_data
            book_data_in_hash['publishers_info'] = Hash.new(0)
            book_data_in_hash['publishers_info']['name'] = publication_data.name
            book_data_in_hash['publishers_info']['email'] = publication_data.email
            book_data_in_hash['publishers_info']['contact'] = publication_data.contact
            book_data_in_hash['publishers_info']['address'] = publication_data.address 
            @data.push(book_data_in_hash)
			   }
			redis.set(params['key'], @data.to_json)
		  end
	  end
	end
end