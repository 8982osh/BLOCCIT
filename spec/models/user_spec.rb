require 'rails_helper'

describe User do
  
  include TestFactories

  describe "#favorited(post)" 

  before do
    
    @post = associated_post
    @user = authenticated_user

    it "returns 'nil' if the user has not favorited the post" do
    	expect( @user.favorites.find_by_post_id(@post_id) ).to be_nil
    end

    it "returns the appropriate favorite if it exists" do
      favorite = @user.favorites.create(@post_id)
    	#expect( @user.favorites.find_by_post_id(@post_id) )
    end
  end
end