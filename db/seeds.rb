# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# users
tom = User.create(name: 'Tom', posts_counter: 0, photo: 'https://media.istockphoto.com/id/1368215673/video/4k-video-footage-of-a-handsome-young-businessman-standing-alone-in-his-office-during-the-day.jpg?s=640x640&k=20&c=gBEUf0TiVeJZFYpaNAASY_Dfqc_DlYDrYNqkok0V1LQ=', bio: 'Tom is a high school teacher.')
alice = User.create(name: 'Alice', posts_counter: 0, photo: 'https://media.istockphoto.com/id/534137767/photo/black-woman-with-curly-hair-looking-up.jpg?s=612x612&w=0&k=20&c=zl80h9U2K8lh5VQRo7tvWRB9xnZfPNDzTGooyBR03-Q=', bio: 'Alice is a doctor.')
linda = User.create(name: 'Linda', posts_counter: 0, photo: 'https://media.istockphoto.com/id/1386217759/photo/portrait-of-a-confident-young-businesswoman-standing-against-an-urban-background.webp?b=1&s=170667a&w=0&k=20&c=oikPwsT7yx_9XIsNQYte82Fiqg7rBE1tHrlBXWye5jc=', bio: 'Linda is an athlete.')
oscar = User.create(name: 'Oscar', posts_counter: 0, photo: 'https://media.istockphoto.com/id/1008372366/photo/make-each-day-a-success.jpg?s=612x612&w=0&k=20&c=CdKT--2yyFGsmcEj05Tial8wYmQNZs_b3n4b0qJzowA=', bio: 'Oscar is an actor.')

# posts
tom_post_1 = Post.create(author: tom, title: 'Tom\'s first post', text: 'Tom\'s first post', likes_counter: 0)
tom_post_2 = Post.create(author: tom, title: 'Tom\'s second post', text: 'Tom\'s second post', likes_counter: 0)
tom_post_3 = Post.create(author: tom, title: 'Tom\'s third post', text: 'Tom\'s third post', likes_counter: 0)
tom_post_4 = Post.create(author: tom, title: 'Tom\'s fourth post', text: 'Tom\'s fourth post', likes_counter: 0)
tom_post_5 = Post.create(author: tom, title: 'Tom\'s fifth post', text: 'Tom\'s fifth post', likes_counter: 0)

alice_post_1 = Post.create(author: alice, title: 'Alice\'s first post', text: 'Alice\'s first post', likes_counter: 0)
alice_post_2 = Post.create(author: alice, title: 'Alice\'s second post', text: 'Alice\'s second post', likes_counter: 0)
alice_post_3 = Post.create(author: alice, title: 'Alice\'s third post', text: 'Alice\'s third post', likes_counter: 0)

linda_post_1 = Post.create(author: linda, title: 'Linda\'s first post', text: 'Linda\'s first post', likes_counter: 0)
linda_post_2 = Post.create(author: linda, title: 'Linda\'s second post', text: 'Linda\'s second post', likes_counter: 0)

oscar_post_1 = Post.create(author: oscar, title: 'Oscar\'s first post', text: 'Oscar\'s first post', likes_counter: 0, created_at: 10.days.ago)
oscar_post_2 = Post.create(author: oscar, title: 'Oscar\'s second post', text: 'Oscar\'s second post', likes_counter: 0, created_at: 9.days.ago)
oscar_post_3 = Post.create(author: oscar, title: 'Oscar\'s third post', text: 'Oscar\'s third post', likes_counter: 0, created_at: 8.days.ago)
oscar_post_4 = Post.create(author: oscar, title: 'Oscar\'s fourth post', text: 'Oscar\'s fourth post', likes_counter: 0, created_at: 7.days.ago)
oscar_post_5 = Post.create(author: oscar, title: 'Oscar\'s fifth post', text: 'Oscar\'s fifth post', likes_counter: 0, created_at: 6.days.ago)
oscar_post_6 = Post.create(author: oscar, title: 'Oscar\'s sixth post', text: 'Oscar\'s sixth post', likes_counter: 0, created_at: 5.days.ago)
oscar_post_7 = Post.create(author: oscar, title: 'Oscar\'s seventh post', text: 'Oscar\'s seventh post', likes_counter: 0, created_at: 4.days.ago)
oscar_post_8 = Post.create(author: oscar, title: 'Oscar\'s eighth post', text: 'Oscar\'s eighth post', likes_counter: 0, created_at: 3.days.ago)
oscar_post_9 = Post.create(author: oscar, title: 'Oscar\'s ninth post', text: 'Oscar\'s ninth post', likes_counter: 0, created_at: 2.days.ago)

# comments
tom_comment_1 = Comment.create(post: alice_post_2, user: tom, text: 'Tom\'s first comment', created_at: 10.days.ago)
tom_comment_2 = Comment.create(post: oscar_post_1, user: tom, text: 'Tom\'s second comment', created_at: 8.days.ago)
tom_comment_3 = Comment.create(post: linda_post_1, user: tom, text: 'Tom\'s third comment', created_at: 6.days.ago)
tom_comment_4 = Comment.create(post: linda_post_2, user: tom, text: 'Tom\'s fourth comment', created_at: 5.days.ago)
tom_comment_5 = Comment.create(post: oscar_post_2, user: tom, text: 'Tom\'s fifth comment', created_at: 3.days.ago)
tom_comment_6 = Comment.create(post: oscar_post_3, user: tom, text: 'Tom\'s sixth comment', created_at: 2.days.ago)

alice_comment_1 = Comment.create(post: oscar_post_1, user: alice, text: 'Alice\'s first comment', created_at: 8.days.ago)
alice_comment_2 = Comment.create(post: tom_post_4, user: alice, text: 'Alice\'s second comment', created_at: 4.days.ago)
alice_comment_3 = Comment.create(post: tom_post_1, user: alice, text: 'Alice\'s third comment', created_at: 2.days.ago)

linda_comment_1 = Comment.create(post: alice_post_1, user: linda, text: 'Linda\'s first comment', created_at: 7.days.ago)
linda_comment_2 = Comment.create(post: oscar_post_3, user: linda, text: 'Linda\'s second comment', created_at: 6.days.ago)
linda_comment_3 = Comment.create(post: tom_post_1, user: linda, text: 'Linda\'s third comment', created_at: 5.days.ago)
linda_comment_4 = Comment.create(post: tom_post_2, user: linda, text: 'Linda\'s fourth comment', created_at: 3.days.ago)
linda_comment_5 = Comment.create(post: oscar_post_2, user: linda, text: 'Linda\'s fifth comment', created_at: 2.days.ago)

oscar_comment_1 = Comment.create(post: alice_post_1, user: oscar, text: 'Oscar\'s first comment', created_at: 7.days.ago)
oscar_comment_2 = Comment.create(post: linda_post_2, user: oscar, text: 'Oscar\'s second comment', created_at: 6.days.ago)
oscar_comment_3 = Comment.create(post: tom_post_1, user: oscar, text: 'Oscar\'s third comment', created_at: 5.days.ago)
oscar_comment_4 = Comment.create(post: tom_post_2, user: oscar, text: 'Oscar\'s fourth comment', created_at: 3.days.ago)
oscar_comment_5 = Comment.create(post: tom_post_4, user: oscar, text: 'Oscar\'s fifth comment', created_at: 2.days.ago)

# likes
Like.create(post: tom_post_1, user: alice, created_at: 8.days.ago)
Like.create(post: tom_post_1, user: linda, created_at: 6.days.ago)
Like.create(post: tom_post_1, user: oscar, created_at: 5.days.ago)
Like.create(post: tom_post_2, user: oscar, created_at: 4.days.ago)
Like.create(post: tom_post_2, user: linda, created_at: 3.days.ago)
Like.create(post: tom_post_3, user: oscar, created_at: 3.days.ago)
Like.create(post: tom_post_4, user: linda, created_at: 2.days.ago)

Like.create(post: alice_post_1, user: tom, created_at: 9.days.ago)
Like.create(post: alice_post_1, user: linda, created_at: 7.days.ago)
Like.create(post: alice_post_1, user: oscar, created_at: 7.days.ago)
Like.create(post: alice_post_2, user: tom, created_at: 6.days.ago)
Like.create(post: alice_post_2, user: linda, created_at: 3.days.ago)
Like.create(post: alice_post_2, user: oscar, created_at: 3.days.ago)
Like.create(post: alice_post_3, user: linda, created_at: 2.days.ago)

Like.create(post: linda_post_1, user: tom, created_at: 4.days.ago)
Like.create(post: linda_post_1, user: alice, created_at: 3.days.ago)
Like.create(post: linda_post_2, user: oscar, created_at: 3.days.ago)
Like.create(post: linda_post_2, user: alice, created_at: 2.days.ago)

Like.create(post: oscar_post_1, user: alice, created_at: 8.days.ago)
Like.create(post: oscar_post_1, user: linda, created_at: 6.days.ago)
Like.create(post: oscar_post_1, user: tom, created_at: 5.days.ago)
Like.create(post: oscar_post_2, user: alice, created_at: 4.days.ago)
Like.create(post: oscar_post_2, user: linda, created_at: 3.days.ago)
Like.create(post: oscar_post_3, user: alice, created_at: 8.days.ago)
Like.create(post: oscar_post_3, user: linda, created_at: 6.days.ago)
Like.create(post: oscar_post_4, user: tom, created_at: 5.days.ago)
Like.create(post: oscar_post_4, user: alice, created_at: 4.days.ago)
Like.create(post: oscar_post_4, user: linda, created_at: 3.days.ago)