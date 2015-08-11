 require 'faker'
#if Rails.env.development? 
 Post.destroy_all
 Comment.destroy_all
#end
 # Create Posts
 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 
 #Second post
 #posts = Post.where(title: 'Dog snacks').where(body: 'The best ingredients for the tastiest snacks')
 #if posts.count > 0
    #code
 #end
 post = Post.find_by(title: 'Dog snacks', body: 'The best ingredients for the tastiest snacks')
 if post.nil?
    Post.create!(
     title: "Dog snacks",
     body: "The best ingredients for the tastiest snacks"
 )
 else
    puts "Post already exits"
 end
 
 comment = Comment.find_by(post_id: 1, body: 'Create posting for dog snacks')
 if comment.nil? 
    Comment.create!(
      post_id: 1,
      body: "Create posting for dog snacks"
 )
  else
    puts "Comment already exists"
 end
 
