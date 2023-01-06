require_relative 'lib/database_connection'
require_relative 'lib/post_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('social_network')

post_repository = PostRepository.new

post_repository.all.each do |post|
  p post
end