require 'user_repository'

RSpec.describe UserRepository do

    def reset_users_table
        seed_sql = File.read('spec/seeds_users.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network' })
        connection.exec(seed_sql)
    end

    before(:each) do
        reset_users_table
    end

    it 'returns the list of users' do 
        repo = UserRepository.new

        users = repo.all
        expect(users.length).to eq(2)
        expect(users.first.id).to eq('1')
        expect(users.first.username).to eq('username1')
    end
end