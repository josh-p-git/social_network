require_relative './post'

class PostRepository
    def all
        sql = 'SELECT id, title, content, views, user_id FROM posts;'
        result_set = DatabaseConnection.exec_params(sql, [])

        posts = []

        result_set.each do |record|
            post = Post.new
            post.id = record['id']
            post.title = record['title']
            post.content = record['content']
            post.views = record['views']
            post.user_id = record['user_id']

            posts << post
        end

        return posts
    end
end
