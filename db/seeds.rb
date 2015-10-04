 require 'faker'
 

 5.times do
   user = User.new(
    name:      Faker::Name.name,
    email:     Faker::Internet.email,
    password:  Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all

 #Create topics
 100.times do
   Topic.create!(
    name:        Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph
   )
 end
 topics = Topic.all
 
  #Create Posts
 300.times do
   Post.create!(
     user:   users.sample,
     topic:  topics.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
     )  
 end
 posts = Post.all

 # Create Comments
 300.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )  
 end
 #Commented out everyting below for testing 49 paginate
=begin 
#Create the admin user
 admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!
 
#Create the moderator
 moderator = User.new(
   name:     'Moderator User',
   email:    'moderator@example.com',
   password: 'helloworld',
   role:     'moderator'
   )
 moderator.skip_confirmation!
 moderator.save!
 
#Create the members
 member = User.new(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
)
 member.skip_confirmation!
 member.save!
 
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
=end 
 #Second post
 #  Post.create!(
 #   title: "Dog snacks",
 #   body: "The best ingredients for the tastiest snacks."
 # )

 #Second comment
 #  Comment.create!(
 #   post: post,
 #   body: "This is a second post."
 #  )
  
 #  puts "Unique post finished."
 
 

