class Publication
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :email, type:String
  field :contact, type:Integer
  field :address, type: String
  field :isActive, type: Mongoid::Boolean
  validates :name, presence: true,length: { minimum: 5 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :contact,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 10 }
  validates :isActive,:acceptance => true
  has_one :books

end
