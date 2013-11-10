class Post

  include DataMapper::Resource

  property :id, Serial
  property :body, Text
  property :user, String
  property :username, String
  property :time, DateTime

end