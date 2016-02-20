module TestFactories

  #include Warden::Test::Helpers
  #Warden.test_mode!Warden.test_mode

  RSpec.configure do |config|
    config.include Warden::Test::Helpers
    config.before :suite do
      Warden.test_mode!
    end
  end

  def associated_post(options={})
    post_options = {
      title: 'Post title',
      body: 'Post bodies must be pretty long.',
      topic: Topic.create(name: 'Topic name'),
      user: authenticated_user
    }.merge(options)
    
    Post.create(post_options)
  end
  
  def authenticated_user(options={})
    user_options = {email: "email#{rand}@fake.com", password: 'password'}.merge(options)
    user = User.new(user_options)
    user.skip_confirmation!
    user.save
    user
  end

  RSpec.configure do |config|
    config.after :each do
    Warden.test_reset!
    end
  end
end