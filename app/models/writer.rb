class Writer

  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :email, type:String
  field :mobile, type:Integer
  field :gender, type:String
  field :address, type: String
  field :country, type: Hash
  field :state, type: Hash
  field :city, type: Hash
  field :pincode, type: Integer
  field :isActive, type: Mongoid::Boolean
  validates :name, presence: true,length: { minimum: 5 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :mobile,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 10 }
  validates :pincode,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 6, :maximum => 6 }
  validates :isActive,:acceptance => true
  has_and_belongs_to_many :books
end
