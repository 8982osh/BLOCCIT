require 'rails_helper'

describe User do
  
  include TestFactories

  describe "#favorited(post)" do

    before do
      @post = associated_post
      @user = authenticated_user
    end

    it "returns 'nil' if the user has not favorited the post" do
    	expect( @user.favorites.find_by_post_id(@post.id) ).to be_nil
    end

    it "returns the appropriate favorite if it exists" do
      favorite = @user.favorites.create(post_id: @post.id)
    	expect( @user.favorites.find_by_post_id(@post.id) ).to eq favorite
    end
  end
end
# favorite:
#   id:
#   post_id:
#   user_id: