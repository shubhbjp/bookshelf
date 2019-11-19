class Search
  has_many :books
  has_and_belongs_to_many :writers
  belongs_to :publications
end
