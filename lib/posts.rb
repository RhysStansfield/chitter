class Post

  include DataMapper::Resource

  property :id, Serial
  property :body, Text
  property :user, String
  property :time, String

end