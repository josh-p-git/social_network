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

    it 'returns firstpost as a single result' do
        repo = PostRepository.new

        post = repo.find(1)
        expect(post.title).to eq('firstpost')
    end

    it 'returns mycontent as a single result' do
        repo = PostRepository.new

        post = repo.find(1)
        expect(post.content).to eq('mycontent')
    end

    it 'creates a new post' do
        repo = PostRepository.new

        new_post = Post.new
        new_post.title = 'Hello world'
        new_post.content = 'This is my content'
        new_post.views = '1'
        new_post.user_id = '1'

        repo.create(new_post)

        all_posts = repo.all
        
        expect(all_posts).to include(have_attributes(title: 'Hello world', content: 'This is my content'))
    end
end