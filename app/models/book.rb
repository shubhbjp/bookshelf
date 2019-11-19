class Book

  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title, type: String
  field :about, type: String
  field :category, type: Hash
  field :publication_date, type: Date
  field :writers_id, type:BSON::ObjectId
  field :publications_id, type:BSON::ObjectId

  validates :title, presence: true,length: { minimum: 5 }
  validates :about, presence: true
  validates :category, presence: true
  validates :publication_date, presence: true
  validates :writers_id, presence: true  
  validates :publications_id, presence: true  
  
  has_and_belongs_to_many :writers
  belongs_to :publications
end
