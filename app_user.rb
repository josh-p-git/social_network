require_relative 'lib/database_connection'
require_relative 'lib/user_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('social_network')

user_repository = UserRepository.new


# finding a record

user = user_repository.find(1)
puts "#{user.id} -  #{user.email} - #{user.username}"

# ----------------------------

# creating new post entry

new_entry = UserRepository.new

new_user = User.new
new_user.email = 'email55@email.com'
new_user.username = 'username55'

new_entry.create(new_user)

# ----------------------------


user_repository.all.each do |user|
    p user
  end