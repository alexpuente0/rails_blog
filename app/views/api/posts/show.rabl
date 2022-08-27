collection @comments
node(:post_author) { |_a| @user.name }
attributes :post_id, :text, :user, :author_id
