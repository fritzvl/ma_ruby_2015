class Customer
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :adress, String
  property :e_mail, String
  property :phone_number, String
  property :created_at, DateTime
  property :updated_at, DateTime

  validates_presence_of :name
  validates_presence_of :adress
  validates_presence_of :phone_number
end