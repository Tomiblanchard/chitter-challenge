class Peep

  include DataMapper::Resource

  property :id,       Serial
  property :name,     String
  property :username, String
  property :user,     String
  property :message,  String

  belongs_to :user
end
