# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: "Tony", photo: "https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png", bio: "A man covered in Iron", post_counter: 0)
second_user = User.create(name: "Clint", photo: "https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png", bio: "Throwing pointy sticks as far as possible", post_counter: 0)
third_user = User.create(name: "Peter", photo: "https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png", bio: "Spider aficionado", post_counter: 0)

first_post = Post.create(author_id: first_user.id, title: "Hello", text: "This is my first post", comments_counter: 0, likes_counter: 0)
second_post = Post.create(author_id: first_user.id, title: "Hello", text: "This is my second post", comments_counter: 0, likes_counter: 0)
third_post = Post.create(author_id: first_user.id, title: "Hello", text: "This is my third post", comments_counter: 0, likes_counter: 0)
fourth_post = Post.create(author_id: first_user.id, title: "Hello", text: "This is my fourth post", comments_counter: 0, likes_counter: 0)
fifth_post = Post.create(author_id: second_user.id, title: "Hi there", text: "This is my own post", comments_counter: 0, likes_counter: 0)

Comment.create(post_id: first_post.id, author_id: second_user.id, text: "Hi!")
Comment.create(post_id: first_post.id, author_id: second_user.id, text: "Hello!")
Comment.create(post_id: first_post.id, author_id: second_user.id, text: "Hey there!")
Comment.create(post_id: first_post.id, author_id: third_user.id, text: "Hiii!")
Comment.create(post_id: first_post.id, author_id: third_user.id, text: "How you doing?")
Comment.create(post_id: first_post.id, author_id: third_user.id, text: "Aloha")

