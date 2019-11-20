class BookshelfController < ApplicationController
  def index
  	@books = Book.all
  	@authors_data = Hash.new (0)
  	@books.each { |book| 
                        writer = []
                        book.writers_id.each {
                      		|writer_id| 
                      			writer_data = Writer.find(writer_id)
                      			temp_writer_data = Hash.new(0)
                      			temp_writer_data['name'] = writer_data.name
                      			temp_writer_data['email'] = writer_data.email
                      			temp_writer_data['mobile'] = writer_data.mobile
                      			temp_writer_data['address'] = writer_data.address + ", " + writer_data.city['name'] + ", " + writer_data.state['name'] + ", " + writer_data.country['name'] + ". Pincode: " + writer_data.pincode.to_s
                      			writer.push(temp_writer_data)
                      	}
  		            @authors_data[book._id] = writer
  	}
  end
end
