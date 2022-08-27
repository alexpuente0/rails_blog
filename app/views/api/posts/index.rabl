collection @posts
node(:author) { |_a| @user.name }
attributes :title, :text
