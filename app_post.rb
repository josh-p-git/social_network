require_relative 'lib/database_connection'
require_relative 'lib/post_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('social_network')

post_repository = PostRepository.new

# finding a record

post = post_repository.find(1)
puts "#{post.title} -  #{post.content} - #{post.views}"

# ------------------------

# creating new post entry

new_entry = PostRepository.new

new_post = Post.new
new_post.title = 'Example post'
new_post.content = 'This is my entry'
new_post.views = 100
new_post.user_id = 2

new_entry.create(new_post)

# ----------------------------

post_repository.all.each do |post|
    p post
  end
  