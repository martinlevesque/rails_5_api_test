json.posts @posts do |p|
  json.partial! 'post', post: p
end