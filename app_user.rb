require_relative 'lib/database_connection'
require_relative 'lib/user_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('social_network')

user_repository = UserRepository.new

user_repository.all.each do |user|
  p user
end

user = user_repository.find(1)
puts "#{user.id} -  #{user.email} - #{user.username}"