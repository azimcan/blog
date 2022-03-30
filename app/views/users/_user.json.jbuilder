json.extract! user, :id, :username, :email, :password_digest, :comments, :created_at, :updated_at

json.posts user.posts

json.posts user.posts do |post|
  json.id post.id
  json.title post.title
  json.status post.status
  json.body post.body.body
  json.created_at post.created_at
  json.updated_at post.updated_at
  json.user_id post.user_id
end

