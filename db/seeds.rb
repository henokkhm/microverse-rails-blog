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
tom = User.create(
  name: 'Tom',
  email: 'tom@example.com',
  password: 'passwordtom',
  password_confirmation: 'passwordtom',
  photo: 'https://media.istockphoto.com/id/1368215673/video/4k-video-footage-of-a-handsome-young-businessman-standing-alone-in-his-office-during-the-day.jpg?s=640x640&k=20&c=gBEUf0TiVeJZFYpaNAASY_Dfqc_DlYDrYNqkok0V1LQ=',
  bio: 'Tom is a high school teacher.'
)
alice = User.create(name: 'Alice', email: 'alice@example.com', password: 'passwordalice',
                    password_confirmation: 'passwordalice',
                    photo: 'https://media.istockphoto.com/id/534137767/photo/black-woman-with-curly-hair-looking-up.jpg?s=612x612&w=0&k=20&c=zl80h9U2K8lh5VQRo7tvWRB9xnZfPNDzTGooyBR03-Q=',
                    bio: 'Alice is a doctor.')
linda = User.create(name: 'Linda', email: 'linda@example.com', password: 'passwordlinda',
                    password_confirmation: 'passwordlinda',
                    photo: 'https://media.istockphoto.com/id/1386217759/photo/portrait-of-a-confident-young-businesswoman-standing-against-an-urban-background.webp?b=1&s=170667a&w=0&k=20&c=oikPwsT7yx_9XIsNQYte82Fiqg7rBE1tHrlBXWye5jc=',
                    bio: 'Linda is an athlete.')
oscar = User.create(name: 'Oscar', email: 'oscar@example.com', password: 'passwordoscar',
                    password_confirmation: 'passwordoscar',
                    photo: 'https://media.istockphoto.com/id/1008372366/photo/make-each-day-a-success.jpg?s=612x612&w=0&k=20&c=CdKT--2yyFGsmcEj05Tial8wYmQNZs_b3n4b0qJzowA=',
                    bio: 'Oscar is an actor.')

# posts
tom_post_one = Post.create(author: tom, title: 'Tom\'s first post', text: 'Tom\'s first post')
tom_post_two = Post.create(author: tom, title: 'Tom\'s second post', text: 'Tom\'s second post')
tom_post_three = Post.create(author: tom, title: 'Tom\'s third post', text: 'Tom\'s third post')
tom_post_four = Post.create(author: tom, title: 'Tom\'s fourth post', text: 'Tom\'s fourth post')
Post.create(author: tom, title: 'Tom\'s fifth post', text: 'Tom\'s fifth post')

alice_post_one = Post.create(author: alice, title: 'Alice\'s first post', text: 'Alice\'s first post')
alice_post_two = Post.create(author: alice, title: 'Alice\'s second post', text: 'Alice\'s second post')
alice_post_three = Post.create(author: alice, title: 'Alice\'s third post', text: 'Alice\'s third post')

linda_post_one = Post.create(author: linda, title: 'Linda\'s first post', text: 'Linda\'s first post')
linda_post_two = Post.create(author: linda, title: 'Linda\'s second post', text: 'Linda\'s second post')

oscar_post_one = Post.create(author: oscar, title: 'Oscar\'s first post', text: 'Oscar\'s first post',
                             created_at: 10.days.ago)
oscar_post_two = Post.create(author: oscar, title: 'Oscar\'s second post', text: 'Oscar\'s second post',
                             created_at: 9.days.ago)
oscar_post_three = Post.create(author: oscar, title: 'Oscar\'s third post', text: 'Oscar\'s third post',
                               created_at: 8.days.ago)
oscar_post_four = Post.create(author: oscar, title: 'Oscar\'s fourth post', text: 'Oscar\'s fourth post',
                              created_at: 7.days.ago)
Post.create(author: oscar, title: 'Oscar\'s fifth post', text: 'Oscar\'s fifth post',
            created_at: 6.days.ago)
Post.create(author: oscar, title: 'Oscar\'s sixth post', text: 'Oscar\'s sixth post',
            created_at: 5.days.ago)
Post.create(author: oscar, title: 'Oscar\'s seventh post', text: 'Oscar\'s seventh post',
            created_at: 4.days.ago)
Post.create(author: oscar, title: 'Oscar\'s eighth post', text: 'Oscar\'s eighth post',
            created_at: 3.days.ago)
oscar_post_nine = Post.create(author: oscar, title: 'Oscar\'s ninth post', text: 'Oscar\'s ninth post',
                              created_at: 2.days.ago)

# comments
Comment.create(post: alice_post_two, user: tom, text: 'Tom\'s first comment', created_at: 10.days.ago)
Comment.create(post: oscar_post_one, user: tom, text: 'Tom\'s second comment', created_at: 8.days.ago)
Comment.create(post: linda_post_one, user: tom, text: 'Tom\'s third comment', created_at: 6.days.ago)
Comment.create(post: linda_post_two, user: tom, text: 'Tom\'s fourth comment', created_at: 5.days.ago)
Comment.create(post: oscar_post_two, user: tom, text: 'Tom\'s fifth comment', created_at: 3.days.ago)
Comment.create(post: oscar_post_three, user: tom, text: 'Tom\'s sixth comment', created_at: 2.days.ago)

Comment.create(post: oscar_post_one, user: alice, text: 'Alice\'s first comment',
               created_at: 8.days.ago)
Comment.create(post: tom_post_four, user: alice, text: 'Alice\'s second comment', created_at: 4.days.ago)
Comment.create(post: tom_post_one, user: alice, text: 'Alice\'s third comment', created_at: 2.days.ago)
Comment.create(post: oscar_post_nine, user: alice, text: 'Alice\'s fourth comment',
               created_at: 2.days.ago)

Comment.create(post: alice_post_one, user: linda, text: 'Linda\'s first comment',
               created_at: 7.days.ago)
Comment.create(post: oscar_post_three, user: linda, text: 'Linda\'s second comment',
               created_at: 6.days.ago)
Comment.create(post: tom_post_one, user: linda, text: 'Linda\'s third comment', created_at: 5.days.ago)
Comment.create(post: tom_post_two, user: linda, text: 'Linda\'s fourth comment', created_at: 3.days.ago)
Comment.create(post: oscar_post_two, user: linda, text: 'Linda\'s fifth comment',
               created_at: 2.days.ago)
Comment.create(post: oscar_post_nine, user: linda, text: 'Linda\'s sixth comment',
               created_at: 2.days.ago)

Comment.create(post: alice_post_one, user: oscar, text: 'Oscar\'s first comment',
               created_at: 7.days.ago)
Comment.create(post: linda_post_two, user: oscar, text: 'Oscar\'s second comment',
               created_at: 6.days.ago)
Comment.create(post: tom_post_one, user: oscar, text: 'Oscar\'s third comment', created_at: 5.days.ago)
Comment.create(post: tom_post_two, user: oscar, text: 'Oscar\'s fourth comment', created_at: 3.days.ago)
Comment.create(post: tom_post_four, user: oscar, text: 'Oscar\'s fifth comment', created_at: 2.days.ago)

# likes
Like.create(post: tom_post_one, user: alice, created_at: 8.days.ago)
Like.create(post: tom_post_one, user: linda, created_at: 6.days.ago)
Like.create(post: tom_post_one, user: oscar, created_at: 5.days.ago)
Like.create(post: tom_post_two, user: oscar, created_at: 4.days.ago)
Like.create(post: tom_post_two, user: linda, created_at: 3.days.ago)
Like.create(post: tom_post_three, user: oscar, created_at: 3.days.ago)
Like.create(post: tom_post_four, user: linda, created_at: 2.days.ago)

Like.create(post: alice_post_one, user: tom, created_at: 9.days.ago)
Like.create(post: alice_post_one, user: linda, created_at: 7.days.ago)
Like.create(post: alice_post_one, user: oscar, created_at: 7.days.ago)
Like.create(post: alice_post_two, user: tom, created_at: 6.days.ago)
Like.create(post: alice_post_two, user: linda, created_at: 3.days.ago)
Like.create(post: alice_post_two, user: oscar, created_at: 3.days.ago)
Like.create(post: alice_post_three, user: linda, created_at: 2.days.ago)

Like.create(post: linda_post_one, user: tom, created_at: 4.days.ago)
Like.create(post: linda_post_one, user: alice, created_at: 3.days.ago)
Like.create(post: linda_post_two, user: oscar, created_at: 3.days.ago)
Like.create(post: linda_post_two, user: alice, created_at: 2.days.ago)

Like.create(post: oscar_post_one, user: alice, created_at: 8.days.ago)
Like.create(post: oscar_post_one, user: linda, created_at: 6.days.ago)
Like.create(post: oscar_post_one, user: tom, created_at: 5.days.ago)
Like.create(post: oscar_post_two, user: alice, created_at: 4.days.ago)
Like.create(post: oscar_post_two, user: linda, created_at: 3.days.ago)
Like.create(post: oscar_post_three, user: alice, created_at: 8.days.ago)
Like.create(post: oscar_post_three, user: linda, created_at: 6.days.ago)
Like.create(post: oscar_post_four, user: tom, created_at: 5.days.ago)
Like.create(post: oscar_post_four, user: alice, created_at: 4.days.ago)
Like.create(post: oscar_post_four, user: linda, created_at: 3.days.ago)
Like.create(post: oscar_post_nine, user: tom, created_at: 4.days.ago)
Like.create(post: oscar_post_nine, user: alice, created_at: 4.days.ago)
Like.create(post: oscar_post_nine, user: linda, created_at: 2.days.ago)
