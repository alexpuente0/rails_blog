# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create!(name: "Tony", photo: "https://cdn2.chicmagazine.com.mx/uploads/media/2021/04/01/robert-downey-jr-iron-man.jpg", bio: "A man covered in Iron", post_counter: 0, password: 'generic', email: 'email@generic.com', role: 'admin')
second_user = User.create!(name: "Clint", photo: "https://depor.com/resizer/5gRn6m364LnXQ9YqrPaMrOe37Is=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/M2VGSL6T65FBBKGKVVMBVHOJTY.jpg", bio: "Throwing pointy sticks as far as possible", post_counter: 0, password: 'hawkeye', email: 'email2@generic.com')
third_user = User.create!(name: "Bruce", photo: "https://www.cinemascomics.com/wp-content/uploads/2020/02/she-hulk-mark-ruffalo-960x540.jpg.webp", bio: "Big, mean and green", post_counter: 0, password: 'incredible', email: 'email3@generic.com')
fourth_user = User.create!(name: "Thor", photo: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/thor-1653380224.jpg?resize=768:*", bio: "Literally the god of thunder", post_counter: 0, password: 'mjolnir', email: 'email4@generic.com')
fifth_user = User.create!(name: "Nat", photo: "https://elcomercio.pe/resizer/8m9tP-SliekerO1J3Mme4koGZt0=/1200x1200/smart/filters:format(jpeg):quality(75)/cdn.jwplayer.com/v2/media/pXJ6Jcyq/poster.jpg", bio: "Spider themed spy and assassin", post_counter: 0, password: 'thewidow', email: 'email5@generic.com')
sixth_user = User.create!(name: "Steve", photo: "https://images-na.ssl-images-amazon.com/images/I/91kaC8fv20L.__AC_SY300_SX300_QL70_FMwebp_.jpg", bio: "Old man fan of stripes and stars", post_counter: 0, password: 'capitan', email: 'email6@generic.com')

apost = Post.create!(author_id: first_user.id, title: 'Why do we use it?', text: ' is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using , making it look like readab')
bpost = Post.create(author_id: second_user.id, title: 'Where does it come from? ', text: 'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for')
cpost = Post.create(author_id: third_user.id, title: 'Where can I get some?', text: ' Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)')
dpost = Post.create(author_id: fourth_user.id, title: 'Lorem Ipsum', text: 'le. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn')
epost = Post.create(author_id: fifth_user.id, title: 'Lorem Ipsum', text: 'g through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good ')
fpost = Post.create(author_id: sixth_user.id, title: 'Lorem Ipsum', text: 'ney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the w')
gpost = Post.create(author_id: first_user.id, title: 'Why do we use it?', text: ' is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using , making it look like readab')
hpost = Post.create(author_id: second_user.id, title: 'Where does it come from? ', text: 'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for')
ipost = Post.create(author_id: third_user.id, title: 'Where can I get some?', text: ' Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)')
jpost = Post.create(author_id: fourth_user.id, title: 'Lorem Ipsum', text: 'le. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn')
kpost = Post.create(author_id: fifth_user.id, title: 'Lorem Ipsum', text: 'g through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good ')
lpost = Post.create(author_id: sixth_user.id, title: 'Lorem Ipsum', text: 'ney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the w')
mpost = Post.create(author_id: first_user.id, title: 'Where does it come from? ', text: 'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for')
npost = Post.create(author_id: second_user.id, title: 'Where can I get some?', text: ' Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)')
opost = Post.create(author_id: third_user.id, title: 'Lorem Ipsum', text: 'le. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn')
ppost = Post.create(author_id: fourth_user.id, title: 'Lorem Ipsum', text: 'g through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good ')
qpost = Post.create(author_id: fifth_user.id, title: 'Lorem Ipsum', text: 'ney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the w')
rpost = Post.create(author_id: sixth_user.id, title: 'Where does it come from? ', text: 'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for')

Comment.create!(post_id: apost.id, author_id: sixth_user.id, text: 'm Ipsum used since the 1500s is reproduced below for those interested. ' )
Comment.create(post_id: bpost.id, author_id: fifth_user.id, text: 'd and Evil) by Cicero, written in 45 BC. This book is a treatise on the theo' )
Comment.create(post_id: cpost.id, author_id: fourth_user.id, text: '. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the ' )
Comment.create(post_id: dpost.id, author_id: third_user.id, text: '. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the ' )
Comment.create(post_id: epost.id, author_id: second_user.id, text: 'any variations of passages of Lorem Ipsum available, but the majority ha!' )
Comment.create(post_id: fpost.id, author_id: first_user.id, text: 's opposed to using Content here, content here, making it look lik' )
Comment.create(post_id: gpost.id, author_id: sixth_user.id, text: 'any variations of passages of Lorem Ipsum available, but the majority ha!' )
Comment.create(post_id: hpost.id, author_id: fifth_user.id, text: 'ed to be sure there isnt anything embarrassing hidden in the middle of te' )
Comment.create(post_id: ipost.id, author_id: fourth_user.id, text: 'e cites of the word in classical literature, discovered the undoubtable sou' )
Comment.create(post_id: jpost.id, author_id: third_user.id, text: 'Hi Tony!' )
Comment.create(post_id: kpost.id, author_id: second_user.id, text: '. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the ' )
Comment.create(post_id: lpost.id, author_id: first_user.id, text: 'any variations of passages of Lorem Ipsum available, but the majority ha!' )
Comment.create(post_id: mpost.id, author_id: sixth_user.id, text: 's opposed to using Content here, content here, making it look lik' )


