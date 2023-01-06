require 'post_repository'

RSpec.describe PostRepository do

    def reset_posts_table
        seed_sql = File.read('spec/seeds_posts.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network' })
        connection.exec(seed_sql)
    end

    before(:each) do
        reset_posts_table
    end

    it 'returns the list of posts' do 
        repo = PostRepository.new

        posts = repo.all
        expect(posts.length).to eq(2)
        expect(posts.first.id).to eq('1')
        expect(posts.first.title).to eq('firstpost')
        expect(posts.first.content).to eq('mycontent')
        expect(posts.first.views).to eq('3')
        expect(posts.first.user_id).to eq('1')
    end
end