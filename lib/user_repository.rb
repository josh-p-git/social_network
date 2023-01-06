require_relative './user'

class UserRepository
    def all
        sql = 'SELECT id, username, email FROM users;'
        result_set = DatabaseConnection.exec_params(sql, [])

        users = []

        result_set.each do |record|
            user = User.new
            user.id = record['id']
            user.username = record['username']
            user.email = record['email']

            users << user
        end

        return users
    end
end
