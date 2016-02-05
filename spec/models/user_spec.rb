require 'rails_helper'

describe User do
  
  include TestFactories

  describe "#favorited(post)" do

  	@post = associated_post 
  	@user = authenticate_user
  	#create(:user)

    it "returns 'nil' if the user has not favorited the post" do
    	expect( @user.favorites.find_by_post_id(@post_id) ).to be_nil
    end

    it "returns the appropriate favorite if it exists" do
    	favorite = @user.favorites.where(post: @post).create
    	expect( @user.favorites.find_by_post_id(@post_id) ).not_to be_nil
    end
  end
end